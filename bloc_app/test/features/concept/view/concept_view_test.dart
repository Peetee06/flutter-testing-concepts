import 'package:bloc_app/domain/concept.dart';
import 'package:bloc_app/domain/content_component.dart';
import 'package:bloc_app/domain/section.dart';
import 'package:bloc_app/features/concept/cubit/concept_cubit.dart';
import 'package:bloc_app/features/concept/cubit/concept_state.dart';
import 'package:bloc_app/features/concept/view/concept_view.dart';
import 'package:bloc_app/features/concept/view/widgets/sections_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/helpers.dart';
import '../../../mocks.mocks.dart';

void main() {
  provideDummy(const ConceptState.initial());
  late MockConceptCubit cubit;

  setUp(() {
    cubit = MockConceptCubit();
    when(cubit.stream).thenAnswer((_) => const Stream.empty());
  });

  Future<void> pumpTestWidget(
    WidgetTester tester, {
    Locale? locale,
  }) {
    return tester.pumpApp(
      locale: locale,
      widget: BlocProvider<ConceptCubit>.value(
        value: cubit,
        child: const ConceptView(),
      ),
    );
  }

  group('ConceptView', () {
    testWidgets('renders AppBar in initial state', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const ConceptInitial());
      await pumpTestWidget(tester);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders progress indicator while loading',
        (WidgetTester tester) async {
      when(cubit.state).thenReturn(const ConceptLoading());
      await pumpTestWidget(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets(
      'renders error message when error occurs',
      (WidgetTester tester) async {
        when(cubit.state).thenReturn(const ConceptError('error'));
        await pumpTestWidget(tester);
        expect(find.text('error'), findsOneWidget);
        expect(find.byType(AppBar), findsOneWidget);
      },
    );

    testWidgets('passes sections to ConceptSectionsView',
        (WidgetTester tester) async {
      const concept = Concept(
        id: '1',
        title: {'en': 'Test Concept', 'de': 'Test Konzept'},
        sections: [
          Section(
            content: [
              TextComponent(text: {'en': 'Hello', 'de': 'Hallo'}),
            ],
          ),
        ],
        challengeIds: [],
      );
      when(cubit.state).thenReturn(const ConceptLoaded(concept));
      await pumpTestWidget(tester);
      final sectionsView =
          tester.widget<ConceptSectionsView>(find.byType(ConceptSectionsView));
      expect(sectionsView.sections, concept.sections);
    });

    testWidgets('passes false to ConceptSectionsView when no challenges',
        (WidgetTester tester) async {
      const concept = Concept(
        id: '1',
        title: {'en': 'Test Concept', 'de': 'Test Konzept'},
        sections: [],
        challengeIds: [],
      );
      when(cubit.state).thenReturn(const ConceptLoaded(concept));
      await pumpTestWidget(tester);
      final sectionsView =
          tester.widget<ConceptSectionsView>(find.byType(ConceptSectionsView));
      expect(sectionsView.hasChallenges, false);
    });

    testWidgets('passes true to ConceptSectionsView when challenges',
        (WidgetTester tester) async {
      const concept = Concept(
        id: '1',
        title: {'en': 'Test Concept', 'de': 'Test Konzept'},
        sections: [],
        challengeIds: ['1'],
      );
      when(cubit.state).thenReturn(const ConceptLoaded(concept));
      await pumpTestWidget(tester);
      final sectionsView =
          tester.widget<ConceptSectionsView>(find.byType(ConceptSectionsView));
      expect(sectionsView.hasChallenges, true);
    });
  });
}
