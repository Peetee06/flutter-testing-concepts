import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/features/challenges/view/challenges_route.dart';
import 'package:riverpod_app/features/concept/view/widgets/section_view.dart';
import 'package:riverpod_app/features/concept/view/widgets/sections_view.dart';
import 'package:riverpod_app/features/concepts/concepts_route.dart';
import 'package:riverpod_app/l10n/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../helpers/pump_app.dart';
import '../../../mocks.mocks.dart';

void main() {
  const conceptId = 'test_id';

  group('$SectionsView', () {
    Future<void> pumpTestWidget(
      WidgetTester tester, {
      required List<Section> sections,
      bool hasChallenges = false,
      Locale locale = const Locale('de'),
    }) async {
      await tester.pumpApp(
        locale: locale,
        widget: SectionsView(
          id: conceptId,
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
      final updatedSectionView = tester.widget<SectionView>(
        find.byType(SectionView),
      );
      expect(updatedSectionView.section, sections.last);
    });

    testWidgets('renders smooth page indicator and updates offset',
        (tester) async {
      final sections = [const Section(content: []), const Section(content: [])];
      await pumpTestWidget(tester, sections: sections);

      final smoothIndicator = tester.widget<SmoothPageIndicator>(
        find.byType(SmoothPageIndicator),
      );
      expect(smoothIndicator.count, sections.length);
      expect(smoothIndicator.controller.page, 0);

      await tester.tap(find.byKey(SectionsView.forwardButtonKey));
      await tester.pumpAndSettle();

      final updatedSmoothIndicator = tester.widget<SmoothPageIndicator>(
        find.byType(SmoothPageIndicator),
      );
      expect(updatedSmoothIndicator.controller.page, 1);
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
      // ignore: avoid_redundant_argument_values
      await pumpTestWidget(tester, sections: [], hasChallenges: false);
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
      expect(find.byKey(SectionsView.backButtonKey), findsOneWidget);
    });

    testWidgets(
      'back and forward buttons are hidden when only one section and '
      'no challenges',
      (WidgetTester tester) async {
        await pumpTestWidget(tester, sections: [const Section(content: [])]);
        expect(find.byKey(SectionsView.backButtonKey), findsNothing);
        expect(find.byKey(SectionsView.forwardButtonKey), findsNothing);
      },
    );

    testWidgets('navigation between sections works when no challenges',
        (WidgetTester tester) async {
      await pumpTestWidget(
        tester,
        sections: [
          const Section(content: []),
          const Section(content: []),
          const Section(content: []),
        ],
      );
      expect(find.byKey(SectionsView.backButtonKey), findsNothing);
      expect(find.byKey(SectionsView.forwardButtonKey), findsOneWidget);

      await tester.tap(find.byKey(SectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(SectionsView.backButtonKey), findsOneWidget);
      expect(find.byKey(SectionsView.forwardButtonKey), findsOneWidget);

      await tester.tap(find.byKey(SectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(SectionsView.backButtonKey), findsOneWidget);
      expect(find.byKey(SectionsView.forwardButtonKey), findsNothing);

      await tester.tap(find.byKey(SectionsView.backButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(SectionsView.backButtonKey), findsOneWidget);
      expect(find.byKey(SectionsView.forwardButtonKey), findsOneWidget);

      await tester.tap(find.byKey(SectionsView.backButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(SectionsView.backButtonKey), findsNothing);
      expect(find.byKey(SectionsView.forwardButtonKey), findsOneWidget);
    });

    group('navigates to challenges when', () {
      late MockGoRouter router;

      setUp(() {
        router = MockGoRouter();
        when(router.go(any)).thenAnswer((_) {});
      });

      Future<void> pumpTestWidgetWithGoRouter(
        WidgetTester tester, {
        required List<Section> sections,
        bool hasChallenges = false,
        Locale locale = const Locale('de'),
      }) async {
        await tester.pumpApp(
          locale: locale,
          widget: InheritedGoRouter(
            goRouter: router,
            child: SectionsView(
              id: conceptId,
              sections: sections,
              hasChallenges: hasChallenges,
            ),
          ),
        );
      }

      testWidgets(
        'forward button tapped on last section and hasChallenges is true',
        (tester) async {
          final sections = [
            const Section(content: []),
            const Section(content: []),
          ];
          await pumpTestWidgetWithGoRouter(
            tester,
            sections: sections,
            hasChallenges: true,
          );

          expect(find.byKey(SectionsView.forwardButtonKey), findsOneWidget);
          await tester.tap(find.byKey(SectionsView.forwardButtonKey));
          await tester.pumpAndSettle();

          expect(find.byKey(SectionsView.forwardButtonKey), findsOneWidget);
          expect(find.byKey(SectionsView.backButtonKey), findsOneWidget);

          await tester.tap(find.byKey(SectionsView.forwardButtonKey));
          await tester.pumpAndSettle();

          verify(
            router.go(const ChallengesRoute(id: conceptId).location),
          ).called(1);
        },
      );

      testWidgets(
        'forward button tapped on first section when hasChallenges is true',
        (tester) async {
          final sections = [const Section(content: [])];
          await pumpTestWidgetWithGoRouter(
            tester,
            sections: sections,
            hasChallenges: true,
          );

          expect(find.byKey(SectionsView.forwardButtonKey), findsOneWidget);
          await tester.tap(find.byKey(SectionsView.forwardButtonKey));
          await tester.pumpAndSettle();

          verify(
            router.go(const ChallengesRoute(id: conceptId).location),
          ).called(1);
        },
      );

      testWidgets(
        'forward button tapped with no sections and hasChallenges is true',
        (tester) async {
          await pumpTestWidgetWithGoRouter(
            tester,
            sections: [],
            hasChallenges: true,
          );

          expect(find.byKey(SectionsView.forwardButtonKey), findsOneWidget);
          await tester.tap(find.byKey(SectionsView.forwardButtonKey));
          await tester.pumpAndSettle();

          verify(
            router.go(const ChallengesRoute(id: conceptId).location),
          ).called(1);
        },
      );
    });
  });
}
