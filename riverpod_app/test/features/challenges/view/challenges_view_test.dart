import 'package:common/common.dart' hide Localizations;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/challenges/challenges_notifier.dart';
import 'package:riverpod_app/features/challenges/view/challenges_view.dart';
import 'package:riverpod_app/features/challenges/view/widgets/challenges_list.dart'; // This will be created later
import 'package:riverpod_app/l10n/l10n.dart';

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

  ProviderContainer createContainer(AsyncValue<List<Challenge>> state) {
    final container = ProviderContainer(
      overrides: [
        challengesNotifierProvider(conceptId).overrideWith(
          () => FakeChallengesNotifier(
            challenges: state.asData?.value ?? [],
            behavior: state.maybeMap(
              error: (e) => FutureBehavior(error: e.error),
              loading: (_) => FutureBehavior(loading: true),
              orElse: () => null, // Data state has no special behavior
            ),
          ),
        ),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  Future<void> pumpTestWidget(
    WidgetTester tester,
    AsyncValue<List<Challenge>> state,
  ) {
    final container = createContainer(state);
    // We need the MaterialApp for localization
    return tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ChallengesView(conceptId: conceptId), // Pass conceptId
        ),
      ),
    );
  }

  group('ChallengesView', () {
    testWidgets('renders loading state', (WidgetTester tester) async {
      await pumpTestWidget(tester, const AsyncLoading());
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders loaded state with ChallengesList',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, AsyncData(mockChallenges));
      await tester.pump(); // Allow the widget to build after future completes

      final challengesList =
          tester.widget<ChallengesList>(find.byType(ChallengesList));
      expect(challengesList.challenges, mockChallenges);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders error state', (WidgetTester tester) async {
      await pumpTestWidget(tester, AsyncError(testError, StackTrace.current));
      await tester.pump(); // Allow the widget to build after future completes

      expect(find.text(testError.toString()), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}
