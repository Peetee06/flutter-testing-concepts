import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/concept/view/widgets/section_view.dart';
import 'package:riverpod_app/features/concept/view/widgets/sections_view.dart';
import 'package:riverpod_app/l10n/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../helpers/pump_app.dart';

void main() {
  group(SectionsView, () {
    Future<void> pumpTestWidget(
      WidgetTester tester, {
      required List<Section> sections,
      bool hasChallenges = false,
      Locale locale = const Locale('de'),
    }) async {
      await tester.pumpApp(
        locale: locale,
        widget: SectionsView(
          id: 'id',
          sections: sections,
          hasChallenges: hasChallenges,
        ),
      );
    }

    testWidgets('renders no sections text when sections is empty',
        (tester) async {
      await pumpTestWidget(tester, sections: []);
      final context = tester.element(find.byType(SectionsView));
      expect(find.text(context.l10n.sectionsEmpty), findsOneWidget);
    });

    testWidgets('renders SectionView and passes current section',
        (tester) async {
      final sections = [
        const Section(
          content: [
            ContentComponent.text(text: {'en': 'A'}),
          ],
        ),
        const Section(
          content: [
            ContentComponent.text(text: {'en': 'B'}),
          ],
        ),
      ];
      await pumpTestWidget(tester, sections: sections);
      expect(find.byType(SectionView), findsOneWidget);
      final sectionView = tester.widget<SectionView>(find.byType(SectionView));
      expect(sectionView.section, sections.first);
      await tester.tap(find.byKey(SectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      final updatedSectionView =
          tester.widget<SectionView>(find.byType(SectionView));
      expect(updatedSectionView.section, sections.last);
    });

    testWidgets('renders smooth page indicator', (tester) async {
      final sections = [const Section(content: []), const Section(content: [])];
      await pumpTestWidget(tester, sections: sections);
      expect(find.byType(SmoothPageIndicator), findsOneWidget);
      await tester.tap(find.byKey(SectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(SmoothPageIndicator), findsOneWidget);
    });

    testWidgets('hides smooth page indicator when sections is empty',
        (tester) async {
      await pumpTestWidget(tester, sections: []);
      expect(find.byType(SmoothPageIndicator), findsNothing);
    });

    testWidgets('renders challenge icon when hasChallenges is true',
        (tester) async {
      await pumpTestWidget(tester, sections: [], hasChallenges: true);
      expect(find.byIcon(Icons.task_outlined), findsOneWidget);
    });

    testWidgets('hides challenge icon by default', (tester) async {
      await pumpTestWidget(tester, sections: []);
      expect(find.byIcon(Icons.task_outlined), findsNothing);
    });

    testWidgets('hides challenge icon when hasChallenges is false',
        (tester) async {
      await pumpTestWidget(tester, sections: []);
      expect(find.byIcon(Icons.task_outlined), findsNothing);
    });

    testWidgets(
        'has separator when hasChallenges is true and sections is not empty',
        (tester) async {
      await pumpTestWidget(
        tester,
        sections: [const Section(content: [])],
        hasChallenges: true,
      );
      final row = tester.widget<Row>(find.byType(Row).first);
      expect(row.children.any((child) => child is SizedBox), true);
    });

    testWidgets(
        'hides separator when hasChallenges is false and sections is not empty',
        (tester) async {
      await pumpTestWidget(tester, sections: [const Section(content: [])]);
      final row = tester.widget<Row>(find.byType(Row).first);
      expect(row.children.any((child) => child is SizedBox), false);
    });

    testWidgets(
        'hides separator when hasChallenges is true and sections is empty',
        (tester) async {
      await pumpTestWidget(tester, sections: [], hasChallenges: true);
      final row = tester.widget<Row>(find.byType(Row).first);
      expect(row.children.any((child) => child is SizedBox), false);
    });

    testWidgets(
        'hides separator when hasChallenges is false and sections is empty',
        (tester) async {
      await pumpTestWidget(tester, sections: []);
      final row = tester.widget<Row>(find.byType(Row).first);
      expect(row.children.any((child) => child is SizedBox), false);
    });

    testWidgets('back button is hidden on first section', (tester) async {
      await pumpTestWidget(
        tester,
        sections: [const Section(content: []), const Section(content: [])],
      );
      expect(find.byKey(SectionsView.backButtonKey), findsNothing);
      expect(find.byKey(SectionsView.forwardButtonKey), findsOneWidget);
    });

    testWidgets('forward button is hidden on last section when no challenges',
        (tester) async {
      await pumpTestWidget(
        tester,
        sections: [const Section(content: []), const Section(content: [])],
      );
      await tester.tap(find.byKey(SectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(SectionsView.forwardButtonKey), findsNothing);
    });

    testWidgets('back button is visible after navigating forward',
        (tester) async {
      await pumpTestWidget(
        tester,
        sections: [const Section(content: []), const Section(content: [])],
      );
      await tester.tap(find.byKey(SectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(SectionsView.backButtonKey), findsOneWidget);
    });

    testWidgets('forward button is visible after navigating back',
        (tester) async {
      await pumpTestWidget(
        tester,
        sections: [const Section(content: []), const Section(content: [])],
      );
      await tester.tap(find.byKey(SectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(SectionsView.backButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(SectionsView.forwardButtonKey), findsOneWidget);
    });

    testWidgets(
      'navigates to challenges route (skipped)',
      (tester) async {
        // ignore: lines_longer_than_80_chars
        // TODO(Peetee06): Implement this test once the challenges route is available.
      },
      skip: true,
    );
  });
}
