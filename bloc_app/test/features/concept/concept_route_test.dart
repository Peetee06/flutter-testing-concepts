import 'package:bloc_app/data/repositories/concepts/concepts_repository.dart';
import 'package:bloc_app/features/concept/view/concept_view.dart';
import 'package:bloc_app/features/concepts/concepts_route.dart';
import 'package:bloc_app/routing/go_router.dart';
import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/helpers.dart';
import '../../mocks.mocks.dart';

void main() {
  late MockConceptsRepository mockConceptsRepository;
  const testConceptId = 'test_concept_id';

  const mockConcept = Concept(
    id: testConceptId,
    title: {
      'de': 'Test Concept',
      'en': 'Test Concept',
    },
    sections: [],
    challengeIds: [],
  );

  setUp(() {
    mockConceptsRepository = MockConceptsRepository();

    when(mockConceptsRepository.getConcepts())
        .thenAnswer((_) async => [mockConcept]);

    GetIt.I.registerSingleton<ConceptsRepository>(mockConceptsRepository);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Future<void> pumpTestWidget(WidgetTester tester) async {
    await tester.pumpAppWithRouter(
      router: router(
        initialLocation: const ConceptRoute(
          id: testConceptId,
        ).location,
      ),
    );
    await tester.pumpAndSettle();
  }

  group(ConceptRoute, () {
    testWidgets('renders $ConceptView and fetches concept', (tester) async {
      await pumpTestWidget(tester);

      expect(find.byType(ConceptView), findsOneWidget);

      // Called twice, because ConceptsRoute is stacked on ConceptRoute
      // and both call getConcepts
      verify(mockConceptsRepository.getConcepts()).called(2);
    });
  });
}
