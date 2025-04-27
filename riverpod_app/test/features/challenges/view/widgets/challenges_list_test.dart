import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/features/challenges/view/widgets/challenge_card.dart';
import 'package:riverpod_app/features/challenges/view/widgets/challenges_list.dart';
import 'package:riverpod_app/features/concepts/concepts_route.dart';

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

  Future<void> pumpChallengesList(
    WidgetTester tester, {
    required List<Challenge> challenges,
    required GoRouter router,
    Locale? locale,
  }) async {
    await tester.pumpApp(
      locale: locale ?? const Locale('de'),
      widget: InheritedGoRouter(
        goRouter: router,
        child: ChallengesList(challenges: challenges),
      ),
    );
  }

  group(ChallengesList, () {
    final variant = ChallengesListVariant();

    testWidgets(
      'renders empty state when no challenges',
      variant: variant,
      (tester) async {
        final (:locale, :emptyText, :doneText) = variant.currentValue!;
        await pumpChallengesList(
          tester,
          challenges: const [],
          router: router,
          locale: locale,
        );
        expect(find.text(emptyText), findsOneWidget);
        expect(find.byType(FilledButton), findsOneWidget);
      },
    );

    testWidgets('shows correct number of items', (tester) async {
      await pumpChallengesList(
        tester,
        challenges: challenges,
        router: router,
      );
      expect(find.byType(ChallengeCard), findsNWidgets(2));
    });

    testWidgets(
      'shows done button with correct text',
      variant: variant,
      (tester) async {
        final (:locale, :emptyText, :doneText) = variant.currentValue!;
        await pumpChallengesList(
          tester,
          challenges: challenges,
          router: router,
          locale: locale,
        );
        expect(find.byType(FilledButton), findsOneWidget);
        expect(find.text(doneText), findsOneWidget);
      },
    );

    testWidgets('done button is positioned at the bottom', (tester) async {
      await pumpChallengesList(
        tester,
        challenges: challenges,
        router: router,
      );
      final buttonAlign = tester.widget<Align>(
        find.ancestor(
          of: find.byKey(ChallengesList.doneButtonKey),
          matching: find.byType(Align),
        ),
      );
      expect(buttonAlign.alignment, Alignment.bottomCenter);
    });

    testWidgets('navigates to concepts when done button is tapped',
        (tester) async {
      await pumpChallengesList(
        tester,
        challenges: challenges,
        router: router,
      );
      await tester.tap(find.byKey(ChallengesList.doneButtonKey));
      await tester.pumpAndSettle();

      verify(router.go(const ConceptsRoute().location)).called(1);
    });
  });
}

typedef ChallengesListVariantSignature = ({
  Locale locale,
  String emptyText,
  String doneText,
});

class ChallengesListVariant
    extends ValueVariant<ChallengesListVariantSignature> {
  ChallengesListVariant()
      : super({
          (
            locale: const Locale('de'),
            emptyText: 'Keine Herausforderungen für dieses Konzept verfügbar.',
            doneText: 'Fertig',
          ),
          (
            locale: const Locale('en'),
            emptyText: 'No challenges available for this concept.',
            doneText: 'Done',
          ),
        });

  @override
  String describeValue(ChallengesListVariantSignature value) {
    return 'locale: ${value.locale.languageCode}';
  }
}
