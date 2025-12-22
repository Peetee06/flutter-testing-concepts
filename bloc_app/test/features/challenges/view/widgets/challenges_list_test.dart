import 'package:bloc_app/features/challenges/view/widgets/challenge_card.dart';
import 'package:bloc_app/features/challenges/view/widgets/challenges_list.dart';
import 'package:bloc_app/features/concepts/concepts_route.dart';
import 'package:bloc_app/l10n/l10n.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/helpers.dart';
import '../../../../mocks.mocks.dart';

void main() {
  late MockGoRouter router;

  setUp(() {
    router = MockGoRouter();
    when(router.go(any)).thenAnswer((_) {});
  });

  final challenges = [
    Challenge(
      id: '1',
      question: {
        'en': 'What is Flutter?',
        'de': 'Was ist Flutter?',
      },
      options: [
        const Answer(
          id: 'a1',
          text: {'en': 'A framework', 'de': 'Ein Framework'},
        ),
      ],
      correctAnswerIds: ['a1'],
    ),
    Challenge(
      id: '2',
      question: {
        'en': 'What is Dart?',
        'de': 'Was ist Dart?',
      },
      options: [
        const Answer(
          id: 'a1',
          text: {'en': 'A language', 'de': 'Eine Sprache'},
        ),
        const Answer(id: 'a2', text: {'en': 'A tool', 'de': 'Ein Werkzeug'}),
      ],
      correctAnswerIds: ['a1', 'a2'],
    ),
  ];

  Future<void> pumpAppWithChallengesList(
    WidgetTester tester, {
    required List<Challenge> challenges,
  }) async {
    await tester.pumpApp(
      locale: const Locale('de'),
      widget: Material(
        child: InheritedGoRouter(
          goRouter: router,
          child: ChallengesList(challenges: challenges),
        ),
      ),
    );
  }

  group('ChallengesList', () {
    testWidgets('renders empty state when no challenges', (tester) async {
      await pumpAppWithChallengesList(tester, challenges: []);

      expect(find.text('Keine Herausforderungen verfügbar'), findsOneWidget);
    });

    testWidgets('shows correct number of items', (tester) async {
      await pumpAppWithChallengesList(tester, challenges: challenges);

      expect(find.byType(ChallengeCard), findsNWidgets(2));
    });

    testWidgets('shows done button', (tester) async {
      await pumpAppWithChallengesList(tester, challenges: challenges);

      expect(find.byKey(ChallengesList.doneButtonKey), findsOneWidget);
      final context = tester.element(find.byKey(ChallengesList.doneButtonKey));
      expect(find.text(context.l10n.challengesDoneButtonLabel), findsOneWidget);
    });

    testWidgets('done button is positioned at the bottom', (tester) async {
      await pumpAppWithChallengesList(tester, challenges: challenges);

      final buttonAlign = tester.widget<Align>(
        find.ancestor(
          of: find.byKey(ChallengesList.doneButtonKey),
          matching: find.byType(Align),
        ),
      );

      expect(buttonAlign.alignment, Alignment.bottomCenter);
    });

    testWidgets('navigates back to concepts when done button is tapped',
        (tester) async {
      await pumpAppWithChallengesList(tester, challenges: challenges);

      await tester.tap(find.byKey(ChallengesList.doneButtonKey));
      await tester.pumpAndSettle();

      verify(router.go(const ConceptsRoute().location)).called(1);
    });
  });
}
