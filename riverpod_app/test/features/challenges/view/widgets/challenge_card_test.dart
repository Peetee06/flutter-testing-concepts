import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/challenges/challenge_progress.dart';
import 'package:riverpod_app/features/challenges/challenge_progress_notifier.dart';
import 'package:riverpod_app/features/challenges/view/widgets/challenge_card.dart';

import '../../../../helpers/helpers.dart';

void main() {
  final challenge = Challenge(
    id: '1',
    question: {
      'en': 'What is Flutter?',
      'de': 'Was ist Flutter?',
    },
    options: [
      const Answer(
        id: 'a1',
        text: {
          'en': 'A framework',
          'de': 'Ein Framework',
        },
      ),
      const Answer(
        id: 'a2',
        text: {
          'en': 'A tool',
          'de': 'Ein Werkzeug',
        },
      ),
    ],
    correctAnswerIds: ['a1'],
  );

  Future<void> pumpTestWidget(
    WidgetTester tester, {
    Challenge? testChallenge,
    Locale locale = const Locale('de'),
    ChallengeProgress Function(Ref, ChallengeProgressNotifier)? buildProgress,
  }) async {
    await tester.pumpApp(
      locale: locale,
      overrides: [
        if (buildProgress != null)
          challengeProgressProvider(
            (testChallenge ?? challenge).id,
          ).overrideWithBuild(buildProgress),
      ],
      widget: ChallengeCard(challenge: testChallenge ?? challenge),
    );
  }

  group(ChallengeCard, () {
    final variant = ChallengeCardVariant();

    testWidgets(
      'displays question and options',
      variant: variant,
      (tester) async {
        final (:locale, :question, :option1, :option2) = variant.currentValue!;

        await pumpTestWidget(tester, locale: locale);

        expect(find.text(question), findsOneWidget);
        expect(find.text(option1), findsOneWidget);
        expect(find.text(option2), findsOneWidget);
      },
    );

    testWidgets('shows submit button when not submitted', (tester) async {
      await pumpTestWidget(tester);

      expect(find.byKey(ChallengeCard.submitButtonKey), findsOneWidget);
      expect(find.byKey(ChallengeCard.resetButtonKey), findsNothing);
      expect(find.byKey(ChallengeCard.resultTextKey), findsNothing);
    });

    testWidgets('submit button is disabled when no answer selected',
        (tester) async {
      await pumpTestWidget(tester);

      final submitButton = tester.widget<FilledButton>(
        find.byKey(ChallengeCard.submitButtonKey),
      );
      expect(submitButton.onPressed, isNull);
    });

    testWidgets('submit button is enabled when answer is selected',
        (tester) async {
      await pumpTestWidget(tester);

      await tester.tap(find.text('Ein Framework'));
      await tester.pump();

      final submitButton = tester.widget<FilledButton>(
        find.byKey(ChallengeCard.submitButtonKey),
      );
      expect(submitButton.onPressed, isNotNull);
    });

    testWidgets('tapping an option toggles selection', (tester) async {
      await pumpTestWidget(tester);

      final option1Finder = find.text('Ein Framework');

      await tester.tap(option1Finder);
      await tester.pump();

      final context = tester.element(find.byType(ChallengeCard));
      final container = ProviderScope.containerOf(context);
      var progress = container.read(challengeProgressProvider(challenge.id));

      expect(progress.selectedAnswerIds, {'a1'});

      await tester.tap(option1Finder);
      await tester.pump();

      progress = container.read(challengeProgressProvider(challenge.id));
      expect(progress.selectedAnswerIds, isEmpty);
    });

    testWidgets('shows correct result after submitting correct answer',
        (tester) async {
      await pumpTestWidget(tester);

      await tester.tap(find.text('Ein Framework'));
      await tester.pump();

      await tester.tap(find.byKey(ChallengeCard.submitButtonKey));
      await tester.pump();

      expect(find.byKey(ChallengeCard.resultTextKey), findsOneWidget);
      expect(find.text('Richtig!'), findsOneWidget);
      expect(find.byKey(ChallengeCard.resetButtonKey), findsOneWidget);
      expect(find.byKey(ChallengeCard.submitButtonKey), findsNothing);
    });

    testWidgets('shows incorrect result after submitting wrong answer',
        (tester) async {
      await pumpTestWidget(tester);

      await tester.tap(find.text('Ein Werkzeug'));
      await tester.pump();

      await tester.tap(find.byKey(ChallengeCard.submitButtonKey));
      await tester.pump();

      expect(find.byKey(ChallengeCard.resultTextKey), findsOneWidget);
      expect(find.text('Falsch'), findsOneWidget);
      expect(find.byKey(ChallengeCard.resetButtonKey), findsOneWidget);
    });

    testWidgets('reset button clears progress and shows submit button again',
        (tester) async {
      await pumpTestWidget(tester);

      await tester.tap(find.text('Ein Framework'));
      await tester.pump();
      await tester.tap(find.byKey(ChallengeCard.submitButtonKey));
      await tester.pump();

      expect(find.byKey(ChallengeCard.resetButtonKey), findsOneWidget);

      await tester.tap(find.byKey(ChallengeCard.resetButtonKey));
      await tester.pump();

      expect(find.byKey(ChallengeCard.submitButtonKey), findsOneWidget);
      expect(find.byKey(ChallengeCard.resetButtonKey), findsNothing);
      expect(find.byKey(ChallengeCard.resultTextKey), findsNothing);
    });

    testWidgets('options are not tappable after submission', (tester) async {
      await pumpTestWidget(tester);

      await tester.tap(find.text('Ein Framework'));
      await tester.pump();
      await tester.tap(find.byKey(ChallengeCard.submitButtonKey));
      await tester.pump();

      final context = tester.element(find.byType(ChallengeCard));
      final container = ProviderScope.containerOf(context);
      final progressBefore =
          container.read(challengeProgressProvider(challenge.id));

      await tester.tap(find.text('Ein Werkzeug'));
      await tester.pump();

      final progressAfter =
          container.read(challengeProgressProvider(challenge.id));
      expect(progressAfter.selectedAnswerIds, progressBefore.selectedAnswerIds);
    });

    testWidgets('shows check icon for correct answer after submission',
        (tester) async {
      await pumpTestWidget(tester);

      await tester.tap(find.text('Ein Framework'));
      await tester.pump();
      await tester.tap(find.byKey(ChallengeCard.submitButtonKey));
      await tester.pump();

      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('shows cancel icon for wrong selected answer after submission',
        (tester) async {
      await pumpTestWidget(tester);

      await tester.tap(find.text('Ein Werkzeug'));
      await tester.pump();
      await tester.tap(find.byKey(ChallengeCard.submitButtonKey));
      await tester.pump();

      expect(find.byIcon(Icons.cancel), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);
    });

    testWidgets('displays localized submit text in English', (tester) async {
      await pumpTestWidget(tester, locale: const Locale('en'));

      expect(find.text('Submit'), findsOneWidget);
    });

    testWidgets('displays localized result text in English', (tester) async {
      await pumpTestWidget(tester, locale: const Locale('en'));

      await tester.tap(find.text('A framework'));
      await tester.pump();
      await tester.tap(find.byKey(ChallengeCard.submitButtonKey));
      await tester.pump();

      expect(find.text('Correct!'), findsOneWidget);
      expect(find.text('Try Again'), findsOneWidget);
    });

    testWidgets('displays incorrect text in English for wrong answer',
        (tester) async {
      await pumpTestWidget(tester, locale: const Locale('en'));

      await tester.tap(find.text('A tool'));
      await tester.pump();
      await tester.tap(find.byKey(ChallengeCard.submitButtonKey));
      await tester.pump();

      expect(find.text('Incorrect'), findsOneWidget);
    });
  });
}

typedef ChallengeCardVariantSignature = ({
  Locale locale,
  String question,
  String option1,
  String option2,
});

class ChallengeCardVariant extends ValueVariant<ChallengeCardVariantSignature> {
  ChallengeCardVariant()
      : super({
          (
            locale: const Locale('de'),
            question: 'Was ist Flutter?',
            option1: 'Ein Framework',
            option2: 'Ein Werkzeug',
          ),
          (
            locale: const Locale('en'),
            question: 'What is Flutter?',
            option1: 'A framework',
            option2: 'A tool',
          ),
        });

  @override
  String describeValue(ChallengeCardVariantSignature value) {
    return 'locale: ${value.locale.languageCode}';
  }
}
