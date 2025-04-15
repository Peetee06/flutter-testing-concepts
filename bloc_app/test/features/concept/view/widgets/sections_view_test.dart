import 'package:bloc_app/domain/content_component.dart';
import 'package:bloc_app/domain/section.dart';
import 'package:bloc_app/features/challenges/challenges_route.dart';
import 'package:bloc_app/features/concept/view/widgets/section_view.dart';
import 'package:bloc_app/features/concept/view/widgets/sections_view.dart';
import 'package:bloc_app/features/concepts/concepts_route.dart';
import 'package:bloc_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../helpers/helpers.dart';
import '../../../../mocks.mocks.dart';

void main() {
  group(ConceptSectionsView, () {
    Future<void> pumpTestWidget(
      WidgetTester tester, {
      required List<Section> sections,
      bool hasChallenges = false,
      Locale? locale,
    }) {
      return tester.pumpApp(
        locale: locale,
        widget: ConceptSectionsView(
          id: 'id',
          sections: sections,
          hasChallenges: hasChallenges,
        ),
      );
    }

    testWidgets('renders no sections text when sections is empty',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, sections: []);
      final context = tester.element(find.byType(ConceptSectionsView));
      expect(find.text(context.l10n.conceptSectionEmpty), findsOneWidget);
    });

    testWidgets('renders ConceptSectionView and passes current section',
        (WidgetTester tester) async {
      const sections = [
        Section(
          content: [
            ContentComponent.text(
              text: {
                'en': 'text',
                'de': 'Text',
              },
            ),
          ],
        ),
        Section(
          content: [
            ContentComponent.text(
              text: {
                'en': 'text2',
                'de': 'Text2',
              },
            ),
          ],
        ),
      ];
      await pumpTestWidget(
        tester,
        sections: sections,
      );
      final sectionView = tester.widget<ConceptSectionView>(
        find.byType(ConceptSectionView),
      );
      expect(sectionView.section, sections.first);

      await tester.tap(find.byKey(ConceptSectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      final updatedSectionView = tester.widget<ConceptSectionView>(
        find.byType(ConceptSectionView),
      );
      expect(updatedSectionView.section, sections.last);
    });

    testWidgets('renders smooth page indicator', (WidgetTester tester) async {
      await pumpTestWidget(
        tester,
        sections: [
          const Section(content: []),
          const Section(content: []),
        ],
      );
      final smoothIndicator = tester.widget<SmoothIndicator>(
        find.byType(SmoothIndicator),
      );
      expect(
        smoothIndicator.count,
        [
          const Section(content: []),
          const Section(content: []),
        ].length,
      );
      expect(smoothIndicator.offset, 0);
      await tester.tap(find.byKey(ConceptSectionsView.forwardButtonKey));
      await tester.pumpAndSettle();

      final updatedSmoothIndicator = tester.widget<SmoothIndicator>(
        find.byType(SmoothIndicator),
      );
      expect(updatedSmoothIndicator.offset, 1);
    });

    testWidgets('hides smooth page indicator when sections is empty',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, sections: []);
      expect(find.byType(SmoothIndicator), findsNothing);
    });

    testWidgets('renders challenge icon when hasChallenges is true',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, sections: [], hasChallenges: true);
      expect(find.byIcon(Icons.task_outlined), findsOneWidget);
    });

    testWidgets('hides challenge icon by default', (WidgetTester tester) async {
      await pumpTestWidget(tester, sections: []);
      expect(find.byIcon(Icons.task_outlined), findsNothing);
    });

    testWidgets('hides challenge icon when hasChallenges is false',
        (WidgetTester tester) async {
      // ignore: avoid_redundant_argument_values
      await pumpTestWidget(tester, sections: [], hasChallenges: false);
      expect(find.byIcon(Icons.task_outlined), findsNothing);
    });

    testWidgets(
        'has separator when hasChallenges is true and sections is not empty',
        (WidgetTester tester) async {
      await pumpTestWidget(
        tester,
        sections: [const Section(content: [])],
        hasChallenges: true,
      );
      final row = tester.widget<Row>(find.byType(Row).first);
      expect(
        row.children.any((child) => child is SizedBox),
        true,
      );
    });

    testWidgets(
        'hides separator when hasChallenges is false and sections is not empty',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, sections: [const Section(content: [])]);
      final row = tester.widget<Row>(find.byType(Row).first);
      expect(
        row.children.any((child) => child is SizedBox),
        false,
      );
    });

    testWidgets(
        'hides separator when hasChallenges is true and sections is empty',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, sections: [], hasChallenges: true);
      final row = tester.widget<Row>(find.byType(Row).first);
      expect(
        row.children.any((child) => child is SizedBox),
        false,
      );
    });

    testWidgets(
        'hides separator when hasChallenges is false and sections is empty',
        (WidgetTester tester) async {
      await pumpTestWidget(tester, sections: []);
      final row = tester.widget<Row>(find.byType(Row).first);
      expect(
        row.children.any((child) => child is SizedBox),
        false,
      );
    });

    testWidgets('back button is hidden on first section',
        (WidgetTester tester) async {
      await pumpTestWidget(
        tester,
        sections: [
          const Section(content: []),
          const Section(content: []),
        ],
      );
      expect(find.byKey(ConceptSectionsView.backButtonKey), findsNothing);
      expect(find.byKey(ConceptSectionsView.forwardButtonKey), findsOneWidget);
    });

    testWidgets('forward button is hidden on last section when no challenges',
        (WidgetTester tester) async {
      await pumpTestWidget(
        tester,
        sections: [
          const Section(content: []),
          const Section(content: []),
        ],
      );
      await tester.tap(find.byKey(ConceptSectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(ConceptSectionsView.forwardButtonKey), findsNothing);
      expect(find.byKey(ConceptSectionsView.backButtonKey), findsOneWidget);
    });

    testWidgets(
        'back and forward buttons are hidden when only one section and '
        'no challenges', (WidgetTester tester) async {
      await pumpTestWidget(tester, sections: [const Section(content: [])]);
      expect(find.byKey(ConceptSectionsView.backButtonKey), findsNothing);
      expect(find.byKey(ConceptSectionsView.forwardButtonKey), findsNothing);
    });

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
      expect(find.byKey(ConceptSectionsView.backButtonKey), findsNothing);
      expect(find.byKey(ConceptSectionsView.forwardButtonKey), findsOneWidget);

      await tester.tap(find.byKey(ConceptSectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(ConceptSectionsView.backButtonKey), findsOneWidget);
      expect(find.byKey(ConceptSectionsView.forwardButtonKey), findsOneWidget);

      await tester.tap(find.byKey(ConceptSectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(ConceptSectionsView.backButtonKey), findsOneWidget);
      expect(find.byKey(ConceptSectionsView.forwardButtonKey), findsNothing);

      await tester.tap(find.byKey(ConceptSectionsView.backButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(ConceptSectionsView.backButtonKey), findsOneWidget);
      expect(find.byKey(ConceptSectionsView.forwardButtonKey), findsOneWidget);

      await tester.tap(find.byKey(ConceptSectionsView.backButtonKey));
      await tester.pumpAndSettle();
      expect(find.byKey(ConceptSectionsView.backButtonKey), findsNothing);
      expect(find.byKey(ConceptSectionsView.forwardButtonKey), findsOneWidget);
    });

    group('navigates to challenges when', () {
      late MockGoRouter router;
      setUp(() {
        router = MockGoRouter();
        when(router.go(any)).thenAnswer((_) {});
      });

      Future<void> pumpWithGoRouter(
        WidgetTester tester, {
        required List<Section> sections,
      }) {
        return tester.pumpWidget(
          MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: InheritedGoRouter(
              goRouter: router,
              child: ConceptSectionsView(
                id: 'id',
                sections: sections,
                hasChallenges: true,
              ),
            ),
          ),
        );
      }

      testWidgets(
          'forward button is pressed on last section when hasChallenges '
          'is true', (WidgetTester tester) async {
        await pumpWithGoRouter(
          tester,
          sections: [
            const Section(content: []),
            const Section(content: []),
          ],
        );

        await tester.tap(find.byKey(ConceptSectionsView.forwardButtonKey));
        await tester.pumpAndSettle();

        expect(
          find.byKey(ConceptSectionsView.forwardButtonKey),
          findsOneWidget,
        );
        expect(find.byKey(ConceptSectionsView.backButtonKey), findsOneWidget);

        await tester.tap(find.byKey(ConceptSectionsView.forwardButtonKey));
        verify(router.go(const ChallengesRoute(id: 'id').location)).called(1);
      });

      testWidgets(
          'forward button is pressed on first section when hasChallenges '
          'is true', (WidgetTester tester) async {
        await pumpWithGoRouter(
          tester,
          sections: [
            const Section(content: []),
          ],
        );

        await tester.tap(find.byKey(ConceptSectionsView.forwardButtonKey));
        await tester.pumpAndSettle();

        verify(router.go(const ChallengesRoute(id: 'id').location)).called(1);
      });

      testWidgets(
          'forward button is pressed with no sections when hasChallenges '
          'is true', (WidgetTester tester) async {
        await pumpWithGoRouter(
          tester,
          sections: [],
        );

        await tester.tap(find.byKey(ConceptSectionsView.forwardButtonKey));
        await tester.pumpAndSettle();

        verify(router.go(const ChallengesRoute(id: 'id').location)).called(1);
      });
    });
  });
}
