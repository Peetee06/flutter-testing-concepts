import 'package:bloc_app/features/challenges/cubit/challenge_progress.dart';
import 'package:bloc_app/features/challenges/cubit/challenge_progress_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(ChallengeProgressCubit, () {
    test('initial state has empty selection and is not submitted', () {
      final cubit = ChallengeProgressCubit();
      expect(cubit.state, const ChallengeProgress());
    });

    group('toggleAnswer', () {
      blocTest<ChallengeProgressCubit, ChallengeProgress>(
        'selects an answer when not selected',
        build: ChallengeProgressCubit.new,
        act: (cubit) => cubit.toggleAnswer('answer1'),
        expect: () => [
          const ChallengeProgress(selectedAnswerIds: {'answer1'}),
        ],
      );

      blocTest<ChallengeProgressCubit, ChallengeProgress>(
        'deselects an answer when already selected',
        build: ChallengeProgressCubit.new,
        act: (cubit) => cubit
          ..toggleAnswer('answer1')
          ..toggleAnswer('answer1'),
        expect: () => [
          const ChallengeProgress(selectedAnswerIds: {'answer1'}),
          const ChallengeProgress(),
        ],
      );

      blocTest<ChallengeProgressCubit, ChallengeProgress>(
        'can select multiple answers',
        build: ChallengeProgressCubit.new,
        act: (cubit) => cubit
          ..toggleAnswer('answer1')
          ..toggleAnswer('answer2'),
        expect: () => [
          const ChallengeProgress(selectedAnswerIds: {'answer1'}),
          const ChallengeProgress(selectedAnswerIds: {'answer1', 'answer2'}),
        ],
      );

      blocTest<ChallengeProgressCubit, ChallengeProgress>(
        'does nothing when already submitted',
        build: ChallengeProgressCubit.new,
        act: (cubit) => cubit
          ..toggleAnswer('answer1')
          ..submit()
          ..toggleAnswer('answer2'),
        expect: () => [
          const ChallengeProgress(selectedAnswerIds: {'answer1'}),
          const ChallengeProgress(
            selectedAnswerIds: {'answer1'},
            isSubmitted: true,
          ),
        ],
      );
    });

    group('submit', () {
      blocTest<ChallengeProgressCubit, ChallengeProgress>(
        'marks the challenge as submitted',
        build: ChallengeProgressCubit.new,
        act: (cubit) => cubit
          ..toggleAnswer('answer1')
          ..submit(),
        expect: () => [
          const ChallengeProgress(selectedAnswerIds: {'answer1'}),
          const ChallengeProgress(
            selectedAnswerIds: {'answer1'},
            isSubmitted: true,
          ),
        ],
      );

      blocTest<ChallengeProgressCubit, ChallengeProgress>(
        'does nothing when already submitted',
        build: ChallengeProgressCubit.new,
        act: (cubit) => cubit
          ..submit()
          ..submit(),
        expect: () => [
          const ChallengeProgress(isSubmitted: true),
        ],
      );
    });

    group('reset', () {
      blocTest<ChallengeProgressCubit, ChallengeProgress>(
        'clears all selections and submission status',
        build: ChallengeProgressCubit.new,
        act: (cubit) => cubit
          ..toggleAnswer('answer1')
          ..toggleAnswer('answer2')
          ..submit()
          ..reset(),
        expect: () => [
          const ChallengeProgress(selectedAnswerIds: {'answer1'}),
          const ChallengeProgress(selectedAnswerIds: {'answer1', 'answer2'}),
          const ChallengeProgress(
            selectedAnswerIds: {'answer1', 'answer2'},
            isSubmitted: true,
          ),
          const ChallengeProgress(),
        ],
      );
    });

    group('isCorrect', () {
      test('returns true when selected answers match correct answers', () {
        final cubit = ChallengeProgressCubit()
          ..toggleAnswer('answer1')
          ..toggleAnswer('answer2');

        expect(cubit.isCorrect(['answer1', 'answer2']), true);
      });

      test('returns false when missing a correct answer', () {
        final cubit = ChallengeProgressCubit()..toggleAnswer('answer1');

        expect(cubit.isCorrect(['answer1', 'answer2']), false);
      });

      test('returns false when selected an incorrect answer', () {
        final cubit = ChallengeProgressCubit()
          ..toggleAnswer('answer1')
          ..toggleAnswer('answer3');

        expect(cubit.isCorrect(['answer1', 'answer2']), false);
      });

      test('returns false when no answers selected and there are correct ones',
          () {
        final cubit = ChallengeProgressCubit();

        expect(cubit.isCorrect(['answer1']), false);
      });

      test('returns true when no answers selected and no correct answers', () {
        final cubit = ChallengeProgressCubit();

        expect(cubit.isCorrect([]), true);
      });
    });
  });
}
