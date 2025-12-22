import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/challenges/challenge_progress.dart';
import 'package:riverpod_app/features/challenges/challenge_progress_notifier.dart';

void main() {
  const challengeId = 'test_challenge_id';
  late List<ChallengeProgress> states;
  late ProviderContainer container;

  ChallengeProgressNotifier getNotifier() =>
      container.read(challengeProgressProvider(challengeId).notifier);

  void listenToNotifier() {
    container.listen<ChallengeProgress>(
      challengeProgressProvider(challengeId),
      (_, next) => states.add(next),
      fireImmediately: true,
    );
  }

  setUp(() {
    states = [];
    container = ProviderContainer.test();
  });

  group(ChallengeProgressNotifier, () {
    test('initial state has empty selection and is not submitted', () {
      listenToNotifier();

      expect(states, [const ChallengeProgress()]);
    });

    group('toggleAnswer', () {
      test('selects an answer when not selected', () {
        listenToNotifier();

        getNotifier().toggleAnswer('answer1');

        expect(states, [
          const ChallengeProgress(),
          const ChallengeProgress(selectedAnswerIds: {'answer1'}),
        ]);
      });

      test('deselects an answer when already selected', () {
        listenToNotifier();

        getNotifier()
          ..toggleAnswer('answer1')
          ..toggleAnswer('answer1');

        expect(states, [
          const ChallengeProgress(),
          const ChallengeProgress(selectedAnswerIds: {'answer1'}),
          const ChallengeProgress(),
        ]);
      });

      test('can select multiple answers', () {
        listenToNotifier();

        getNotifier()
          ..toggleAnswer('answer1')
          ..toggleAnswer('answer2');

        expect(states, [
          const ChallengeProgress(),
          const ChallengeProgress(selectedAnswerIds: {'answer1'}),
          const ChallengeProgress(selectedAnswerIds: {'answer1', 'answer2'}),
        ]);
      });

      test('does nothing when already submitted', () {
        listenToNotifier();

        getNotifier()
          ..toggleAnswer('answer1')
          ..submit()
          ..toggleAnswer('answer2');

        expect(states, [
          const ChallengeProgress(),
          const ChallengeProgress(selectedAnswerIds: {'answer1'}),
          const ChallengeProgress(
            selectedAnswerIds: {'answer1'},
            isSubmitted: true,
          ),
        ]);
      });
    });

    group('submit', () {
      test('marks the challenge as submitted', () {
        listenToNotifier();

        getNotifier()
          ..toggleAnswer('answer1')
          ..submit();

        expect(states, [
          const ChallengeProgress(),
          const ChallengeProgress(selectedAnswerIds: {'answer1'}),
          const ChallengeProgress(
            selectedAnswerIds: {'answer1'},
            isSubmitted: true,
          ),
        ]);
      });

      test('does nothing when already submitted', () {
        listenToNotifier();

        getNotifier()
          ..submit()
          ..submit();

        expect(states, [
          const ChallengeProgress(),
          const ChallengeProgress(isSubmitted: true),
        ]);
      });
    });

    group('reset', () {
      test('clears all selections and submission status', () {
        listenToNotifier();

        getNotifier()
          ..toggleAnswer('answer1')
          ..toggleAnswer('answer2')
          ..submit()
          ..reset();

        expect(states, [
          const ChallengeProgress(),
          const ChallengeProgress(selectedAnswerIds: {'answer1'}),
          const ChallengeProgress(selectedAnswerIds: {'answer1', 'answer2'}),
          const ChallengeProgress(
            selectedAnswerIds: {'answer1', 'answer2'},
            isSubmitted: true,
          ),
          const ChallengeProgress(),
        ]);
      });
    });

    group('isCorrect', () {
      test('returns true when selected answers match correct answers', () {
        getNotifier()
          ..toggleAnswer('answer1')
          ..toggleAnswer('answer2');

        expect(getNotifier().isCorrect(['answer1', 'answer2']), true);
      });

      test('returns false when missing a correct answer', () {
        getNotifier().toggleAnswer('answer1');

        expect(getNotifier().isCorrect(['answer1', 'answer2']), false);
      });

      test('returns false when selected an incorrect answer', () {
        getNotifier()
          ..toggleAnswer('answer1')
          ..toggleAnswer('answer3');

        expect(getNotifier().isCorrect(['answer1', 'answer2']), false);
      });

      test('returns false when no answers selected and there are correct ones',
          () {
        expect(getNotifier().isCorrect(['answer1']), false);
      });

      test('returns true when no answers selected and no correct answers', () {
        expect(getNotifier().isCorrect([]), true);
      });
    });

    test('different challenge IDs have independent state', () {
      final states1 = <ChallengeProgress>[];
      final states2 = <ChallengeProgress>[];

      container
        ..listen<ChallengeProgress>(
          challengeProgressProvider('challenge1'),
          (_, next) => states1.add(next),
          fireImmediately: true,
        )
        ..listen<ChallengeProgress>(
          challengeProgressProvider('challenge2'),
          (_, next) => states2.add(next),
          fireImmediately: true,
        );

      container.read(challengeProgressProvider('challenge1').notifier)
        ..toggleAnswer('answer1')
        ..submit();

      expect(states1, [
        const ChallengeProgress(),
        const ChallengeProgress(selectedAnswerIds: {'answer1'}),
        const ChallengeProgress(
          selectedAnswerIds: {'answer1'},
          isSubmitted: true,
        ),
      ]);
      expect(states2, [const ChallengeProgress()]);
    });
  });
}
