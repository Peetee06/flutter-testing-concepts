import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/concept/concept_notifier.dart';
import 'package:riverpod_app/features/concept/view/concept_view.dart';
import 'package:riverpod_app/features/concept/view/widgets/sections_view.dart';

import '../../../helpers/helpers.dart';
import '../../concept/fake_concept_notifier.dart';

void main() {
  const testConcept = Concept(
    id: '1',
    title: {'en': 'Test Concept', 'de': 'Test Konzept'},
    sections: [
      Section(
        content: [
          ContentComponent.text(text: {'en': 'Hello', 'de': 'Hallo'}),
        ],
      ),
    ],
    challengeIds: [],
  );

  Future<void> pumpTestWidget(
    WidgetTester tester, {
    required Concept concept,
    FutureBehavior? behavior,
    Locale locale = const Locale('de'),
  }) async {
    await tester.pumpApp(
      widget: ConceptView(id: concept.id),
      overrides: [
        conceptNotifierProvider(concept.id).overrideWith(
          () => FakeConceptNotifier(concept: concept, behavior: behavior),
        ),
      ],
      locale: locale,
    );
  }

  group('ConceptView', () {
    testWidgets('renders AppBar in loaded state', (tester) async {
      await pumpTestWidget(
        tester,
        concept: testConcept,
      );
      await tester.pump();
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('Test Konzept'), findsOneWidget);
    });

    testWidgets('renders progress indicator while loading', (tester) async {
      await tester.pumpApp(
        widget: ConceptView(id: testConcept.id),
        overrides: [
          conceptNotifierProvider(testConcept.id).overrideWith(
            () => FakeConceptNotifier(
              concept: testConcept,
              behavior: FutureBehavior(loading: true),
            ),
          ),
        ],
      );
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders error message when error occurs', (tester) async {
      final error = Exception('error');
      await tester.pumpApp(
        widget: ConceptView(id: testConcept.id),
        overrides: [
          conceptNotifierProvider(testConcept.id).overrideWith(
            () => FakeConceptNotifier(
              concept: testConcept,
              behavior: FutureBehavior(error: error),
            ),
          ),
        ],
      );
      await tester.pump();
      expect(find.textContaining('error'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('passes sections to SectionsView', (tester) async {
      await pumpTestWidget(tester, concept: testConcept);
      await tester.pump();
      final sectionsView =
          tester.widget<SectionsView>(find.byType(SectionsView));
      expect(sectionsView.sections, testConcept.sections);
    });

    testWidgets('passes false to SectionsView when no challenges',
        (tester) async {
      await pumpTestWidget(tester, concept: testConcept);
      await tester.pump();
      final sectionsView =
          tester.widget<SectionsView>(find.byType(SectionsView));
      expect(sectionsView.hasChallenges, false);
    });

    testWidgets('passes true to SectionsView when challenges', (tester) async {
      const conceptWithChallenges = Concept(
        id: '2',
        title: {'en': 'Test Concept', 'de': 'Test Konzept'},
        sections: [],
        challengeIds: ['1'],
      );
      await pumpTestWidget(tester, concept: conceptWithChallenges);
      await tester.pump();
      final sectionsView =
          tester.widget<SectionsView>(find.byType(SectionsView));
      expect(sectionsView.hasChallenges, true);
    });
  });
}
