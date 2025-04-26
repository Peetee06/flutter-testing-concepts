import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/features/concept/concept_route.dart';
import 'package:riverpod_app/features/concepts/concepts_notifier.dart';
import 'package:riverpod_app/features/concepts/concepts_route.dart';
import 'package:riverpod_app/features/concepts/view/concepts_view.dart';
import 'package:riverpod_app/l10n/l10n.dart';

import '../../../helpers/helpers.dart';
import '../../../mocks.mocks.dart';
import '../fake_concepts_notifier.dart';

void main() {
  late FakeConceptsNotifier fakeConceptsNotifier;
  late MockGoRouter router;

  setUp(() {
    router = MockGoRouter();
    when(router.go(any)).thenAnswer((_) {});
  });

  Future<void> pumpConceptsView(
    WidgetTester tester, {
    required List<Concept> concepts,
    FutureBehavior? behavior,
    Locale locale = const Locale('de'),
  }) async {
    fakeConceptsNotifier = FakeConceptsNotifier(
      concepts: concepts,
      behavior: behavior,
    );
    await tester.pumpApp(
      overrides: [
        conceptsNotifierProvider.overrideWith(
          () => fakeConceptsNotifier,
        ),
      ],
      locale: locale,
      widget: InheritedGoRouter(
        goRouter: router,
        child: const ConceptsView(),
      ),
    );
  }

  group(ConceptsView, () {
    testWidgets('has correct localized title', (tester) async {
      await pumpConceptsView(tester, concepts: []);
      final context = tester.element(find.byType(ConceptsView));
      expect(find.text(context.l10n.conceptsViewTitle), findsOneWidget);
    });

    testWidgets('renders initial state as empty', (tester) async {
      await pumpConceptsView(tester, concepts: []);
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(ConceptsView));
      expect(find.text(context.l10n.conceptsEmpty), findsOneWidget);
    });

    testWidgets('renders loading state', (tester) async {
      await pumpConceptsView(
        tester,
        concepts: [],
        behavior: FutureBehavior(loading: true),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'renders error state and invalidates provider on try again pressed',
        (tester) async {
      await pumpConceptsView(
        tester,
        concepts: [],
        behavior: FutureBehavior(error: 'Error'),
      );
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(ConceptsView));
      expect(find.textContaining('Error'), findsOneWidget);
      expect(find.text(context.l10n.conceptsTryAgain), findsOneWidget);

      fakeConceptsNotifier.updateFake(concepts: []);
      await tester.tap(find.text(context.l10n.conceptsTryAgain));
      await tester.pumpAndSettle();
      expect(find.text(context.l10n.conceptsEmpty), findsOneWidget);
    });

    final conceptsLocaleVariant = ConceptsLocaleVariant();
    testWidgets(
      'renders list of concepts with correct info',
      variant: conceptsLocaleVariant,
      (tester) async {
        final config = conceptsLocaleVariant.currentValue!;
        final concepts = [
          const Concept(
            id: '1',
            title: {'en': 'Test Concept', 'de': 'Test Konzept'},
            sections: [
              Section(
                content: [
                  ContentComponent.text(text: {'en': 'Hello', 'de': 'Hallo'}),
                ],
              ),
            ],
            challengeIds: ['1'],
          ),
          const Concept(
            id: '2',
            title: {'en': 'Test Concept 2', 'de': 'Test Konzept 2'},
            sections: [],
            challengeIds: [],
          ),
        ];
        await pumpConceptsView(
          tester,
          concepts: concepts,
          locale: config.locale,
        );
        await tester.pumpAndSettle();
        final context = tester.element(find.byType(ConceptsView));
        expect(find.byType(ListView), findsOneWidget);
        expect(find.text(config.expectedTitle1), findsOneWidget);
        expect(find.text(context.l10n.conceptsSections(1)), findsOneWidget);
        expect(find.text(context.l10n.conceptsChallenges(1)), findsOneWidget);
        expect(find.text(config.expectedTitle2), findsOneWidget);
        expect(find.text(context.l10n.conceptsSections(0)), findsOneWidget);
        expect(find.text(context.l10n.conceptsChallenges(0)), findsOneWidget);
      },
    );

    testWidgets(
      'navigates to concept details when tapping a concept',
      (tester) async {
        final concepts = [
          const Concept(
            id: '1',
            title: {'en': 'Test Concept', 'de': 'Test Konzept'},
            sections: [],
            challengeIds: [],
          ),
        ];
        await pumpConceptsView(
          tester,
          concepts: concepts,
        );
        await tester.pumpAndSettle();
        await tester.tap(find.text('Test Konzept'));
        await tester.pumpAndSettle();
        verify(
          router.go(
            argThat(
              equals(
                const ConceptRoute(id: '1').location,
              ),
            ),
          ),
        ).called(1);
      },
    );
  });
}

typedef ConceptsLocaleVariantSignature = ({
  Locale locale,
  String expectedTitle1,
  String expectedTitle2,
});

class ConceptsLocaleVariant
    extends ValueVariant<ConceptsLocaleVariantSignature> {
  ConceptsLocaleVariant()
      : super(<ConceptsLocaleVariantSignature>{
          (
            locale: const Locale('en'),
            expectedTitle1: 'Test Concept',
            expectedTitle2: 'Test Concept 2',
          ),
          (
            locale: const Locale('de'),
            expectedTitle1: 'Test Konzept',
            expectedTitle2: 'Test Konzept 2',
          ),
        });

  @override
  String describeValue(ConceptsLocaleVariantSignature value) {
    return "locale: '${value.locale.languageCode}'";
  }
}
