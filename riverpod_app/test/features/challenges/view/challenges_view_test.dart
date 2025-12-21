import 'package:common/common.dart' hide Localizations;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/challenges/challenges_notifier.dart';
import 'package:riverpod_app/features/challenges/view/challenges_view.dart';
import 'package:riverpod_app/features/challenges/view/widgets/challenges_list.dart';

import '../../../helpers/helpers.dart';
import '../fake_challenges_notifier.dart';

void main() {
  const conceptId = 'test_concept_id';
  final mockChallenges = [
    Challenge(
      id: '1',
      question: {
        'en': 'Test Challenge',
        'de': 'Test Herausforderung',
      },
      options: [
        const Answer(
          id: '1',
          text: {
            'en': 'Test Option',
            'de': 'Test Beschreibung',
          },
        ),
      ],
      correctAnswerIds: ['1'],
    ),
  ];
  final testError = Exception('Test error');

  Future<void> pumpTestWidget(
    WidgetTester tester, {
    List<Challenge> challenges = const [],
    FutureBehavior? behavior,
  }) async {
    await tester.pumpApp(
      overrides: [
        challengesProvider(conceptId).overrideWith(
          () => FakeChallengesNotifier(
            challenges: challenges,
            behavior: behavior,
          ),
        ),
      ],
      widget: const ChallengesView(conceptId: conceptId),
    );
  }

  group('ChallengesView', () {
    testWidgets('renders loading state', (WidgetTester tester) async {
      await pumpTestWidget(
        tester,
        behavior: FutureBehavior(loading: true),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders loaded state with ChallengesList',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, challenges: mockChallenges);
      await tester.pump();

      final challengesList =
          tester.widget<ChallengesList>(find.byType(ChallengesList));
      expect(challengesList.challenges, mockChallenges);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders error state', (WidgetTester tester) async {
      await pumpTestWidget(
        tester,
        behavior: FutureBehavior(error: testError),
      );
      await tester.pump();

      expect(find.text(testError.toString()), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}
