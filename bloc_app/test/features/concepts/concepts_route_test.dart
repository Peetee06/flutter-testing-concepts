import 'package:bloc_app/data/repositories/concepts/concepts_repository.dart';
import 'package:bloc_app/features/concepts/concepts_route.dart';
import 'package:bloc_app/features/concepts/view/concepts_view.dart';
import 'package:bloc_app/routing/go_router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/helpers.dart';
import '../../mocks.mocks.dart';

void main() {
  late MockConceptsRepository mockConceptsRepository;

  setUp(() {
    mockConceptsRepository = MockConceptsRepository();

    when(mockConceptsRepository.getConcepts()).thenAnswer((_) async => []);

    GetIt.I.registerSingleton<ConceptsRepository>(mockConceptsRepository);
  });

  tearDown(() {
    GetIt.I.reset();
  });

  Future<void> pumpTestWidget(WidgetTester tester) async {
    await tester.pumpAppWithRouter(
      router: router(
        initialLocation: ConceptsRoute().location,
      ),
    );
  }

  group(ConceptsRoute, () {
    testWidgets('renders $ConceptsView and fetches concepts', (tester) async {
      await pumpTestWidget(tester);

      expect(find.byType(ConceptsView), findsOneWidget);

      verify(mockConceptsRepository.getConcepts()).called(1);
    });
  });
}
