import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/concepts/concepts_notifier.dart';
import 'package:riverpod_app/features/concepts/view/concepts_view.dart';
import 'package:riverpod_app/l10n/l10n.dart';

import '../../../helpers/helpers.dart';
import '../fake_concepts_notifier.dart';

void main() {
  late FakeConceptsNotifier fakeConceptsNotifier;

  Future<void> pumpConceptsView(
    WidgetTester tester, {
    required List<Concept> concepts,
    FutureBehavior? behavior,
    Locale? locale,
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
      widget: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: locale,
        home: const ConceptsView(),
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

    testWidgets('renders list of concepts with correct info (en)',
        (tester) async {
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
        locale: const Locale('en'),
      );
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(ConceptsView));
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Test Concept'), findsOneWidget);
      expect(find.text(context.l10n.conceptsSections(1)), findsOneWidget);
      expect(find.text(context.l10n.conceptsChallenges(1)), findsOneWidget);
      expect(find.text('Test Concept 2'), findsOneWidget);
      expect(find.text(context.l10n.conceptsSections(0)), findsOneWidget);
      expect(find.text(context.l10n.conceptsChallenges(0)), findsOneWidget);
    });

    testWidgets('renders list of concepts with correct info (de)',
        (tester) async {
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
        locale: const Locale('de'),
      );
      await tester.pumpAndSettle();
      final context = tester.element(find.byType(ConceptsView));
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Test Konzept'), findsOneWidget);
      expect(find.text(context.l10n.conceptsSections(1)), findsOneWidget);
      expect(find.text(context.l10n.conceptsChallenges(1)), findsOneWidget);
      expect(find.text('Test Konzept 2'), findsOneWidget);
      expect(find.text(context.l10n.conceptsSections(0)), findsOneWidget);
      expect(find.text(context.l10n.conceptsChallenges(0)), findsOneWidget);
    });

    testWidgets(
      'navigates to concept details when tapping a concept',
      (tester) async {
        // TODO(Peetee06): Implement this test once ConceptRoute is implemented
      },
      skip: true,
    );
  });
}
