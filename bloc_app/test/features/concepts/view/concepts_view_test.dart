import 'package:bloc_app/domain/concept.dart';
import 'package:bloc_app/domain/content_component.dart';
import 'package:bloc_app/domain/section.dart';
import 'package:bloc_app/features/concept/concept_route.dart';
import 'package:bloc_app/features/concepts/concepts_route.dart';
import 'package:bloc_app/features/concepts/cubit/concepts_cubit.dart';
import 'package:bloc_app/features/concepts/cubit/concepts_state.dart';
import 'package:bloc_app/features/concepts/view/concepts_view.dart';
import 'package:bloc_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/helpers.dart';
import '../../../mocks.mocks.dart';

void main() {
  provideDummy(const ConceptsState.initial());
  late MockConceptsCubit cubit;
  late MockGoRouter router;

  setUp(() {
    cubit = MockConceptsCubit();
    when(cubit.stream).thenAnswer((_) => const Stream.empty());
    router = MockGoRouter();
    when(router.go(any)).thenAnswer((_) {});
  });

  Future<void> pumpTestWidget(WidgetTester tester) {
    return tester.pumpApp(
      widget: InheritedGoRouter(
        goRouter: router,
        child: BlocProvider<ConceptsCubit>.value(
          value: cubit,
          child: const ConceptsView(),
        ),
      ),
    );
  }

  group(ConceptsView, () {
    testWidgets('has correct title', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const ConceptsState.initial());
      await pumpTestWidget(tester);
      final BuildContext context = tester.element(find.byType(ConceptsView));
      expect(find.text(context.l10n.conceptsViewTitle), findsOneWidget);
    });

    testWidgets('renders initial state', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const ConceptsState.initial());
      await pumpTestWidget(tester);
      expect(find.byType(SizedBox), findsOneWidget);
    });

    testWidgets('renders loading state', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const ConceptsState.loading());
      await pumpTestWidget(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders concepts', (WidgetTester tester) async {
      final concepts = [
        Concept(
          id: '1',
          title: {
            'en': 'Test Concept',
            'de': 'Test Konzept',
          },
          sections: [
            Section(
              content: [
                const ContentComponent.text(
                  text: {
                    'en': 'Hello',
                    'de': 'Hallo',
                  },
                ),
                ContentComponent.image(
                  imageUri: Uri.parse('https://example.com/image.jpg'),
                ),
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
      when(cubit.state).thenReturn(ConceptsState.loaded(concepts));
      await pumpTestWidget(tester);
      final BuildContext context = tester.element(find.byType(ConceptsView));
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Test Konzept'), findsOneWidget);
      expect(find.text(context.l10n.conceptsSections(1)), findsOneWidget);
      expect(find.text(context.l10n.conceptsChallenges(1)), findsOneWidget);
      expect(find.text('Test Konzept 2'), findsOneWidget);
      expect(find.text(context.l10n.conceptsSections(0)), findsOneWidget);
      expect(find.text(context.l10n.conceptsChallenges(0)), findsOneWidget);
    });

    testWidgets('navigates to concept on concept tap', (tester) async {
      const conceptId = 'concept1';
      final concepts = [
        const Concept(
          id: conceptId,
          title: {'en': 'Test Concept', 'de': 'Test Konzept'},
          sections: [],
          challengeIds: [],
        ),
      ];
      when(cubit.state).thenReturn(ConceptsState.loaded(concepts));
      await pumpTestWidget(tester);

      await tester.tap(find.text('Test Konzept'));
      await tester.pumpAndSettle();

      verify(
        router.go(
          argThat(
            equals(
              const ConceptRoute(id: conceptId).location,
            ),
          ),
        ),
      ).called(1);
    });

    testWidgets('renders error state and fetches concepts on try again tap',
        (WidgetTester tester) async {
      when(cubit.state).thenReturn(const ConceptsState.error('Error'));
      await pumpTestWidget(tester);
      final BuildContext context = tester.element(find.byType(ConceptsView));

      expect(find.text('Error'), findsOneWidget);
      expect(find.text(context.l10n.conceptsTryAgain), findsOneWidget);

      await tester.tap(find.text(context.l10n.conceptsTryAgain));
      verify(cubit.fetchConcepts()).called(1);
    });
  });

  testWidgets('Pulling down fetches concepts', (WidgetTester tester) async {
    when(cubit.state).thenReturn(
      const ConceptsState.loaded([
        Concept(
          id: '1',
          title: {'en': 'Test Concept', 'de': 'Test Konzept'},
          sections: [],
          challengeIds: [],
        ),
      ]),
    );
    await pumpTestWidget(tester);
    await tester.drag(find.byType(ListView), const Offset(0, 500));
    await tester.pumpAndSettle();
    verify(cubit.fetchConcepts()).called(1);
  });

  testWidgets('shows empty state', (WidgetTester tester) async {
    when(cubit.state).thenReturn(const ConceptsState.loaded([]));
    await pumpTestWidget(tester);
    final BuildContext context = tester.element(find.byType(ConceptsView));
    expect(find.text(context.l10n.conceptsEmpty), findsOneWidget);
  });
}
