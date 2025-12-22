import 'package:bloc_app/data/repositories/challenges/challenges_repository.dart';
import 'package:bloc_app/data/repositories/concepts/concepts_repository.dart';
import 'package:bloc_app/data/services/interceptors/json_interceptor.dart';
import 'package:bloc_app/data/services/rest_client.dart';
import 'package:bloc_app/features/challenges/view/challenges_view.dart';
import 'package:bloc_app/features/concept/view/concept_view.dart';
import 'package:bloc_app/features/concepts/view/concepts_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';

import './challenges_robot.dart';
import './mocks.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockCacheManager cacheManager;

  setUp(() async {
    cacheManager = MockCacheManager();
    when(
      cacheManager.getFileStream(
        any,
        key: anyNamed('key'),
        headers: anyNamed('headers'),
        withProgress: anyNamed('withProgress'),
      ),
    ).thenAnswer(
      (_) => const Stream<FileResponse>.empty(),
    );
    final dio = Dio()..interceptors.add(JsonInterceptor());
    final restClient = RestClient(dio);
    GetIt.I.registerSingleton<ConceptsRepository>(
      ConceptsRepository(restClient: restClient),
    );
    GetIt.I.registerSingleton<ChallengesRepository>(
      ChallengesRepository(restClient: restClient),
    );
    GetIt.I.registerSingleton<BaseCacheManager>(cacheManager);
  });

  tearDown(() async {
    GetIt.I.unregister<ConceptsRepository>();
    GetIt.I.unregister<ChallengesRepository>();
    GetIt.I.unregister<BaseCacheManager>();
  });

  group('App Integration Test', () {
    testWidgets('Concept flow', (WidgetTester tester) async {
      final robot = ChallengesRobot(tester);
      await robot.pumpApp();

      expect(find.byType(ConceptsView), findsOneWidget);

      await robot.tapFirstConcept();

      expect(find.byType(ConceptView), findsOneWidget);

      await robot.navigateThroughSectionsToChallenges();

      expect(find.byType(ChallengesView), findsOneWidget);

      await robot.tapDoneButton();

      expect(find.byType(ConceptsView), findsOneWidget);
    });

    testWidgets('Challenge progress flow', (WidgetTester tester) async {
      final robot = ChallengesRobot(tester);
      await robot.pumpApp();
      await robot.tapFirstConcept();
      await robot.navigateThroughSectionsToChallenges();

      expect(find.byType(ChallengesView), findsOneWidget);
      expect(robot.isSubmitButtonEnabled, isFalse);

      await robot.tapAnswerOption('Option 2 EN');

      expect(robot.isSubmitButtonEnabled, isTrue);

      await robot.tapSubmitButton();

      expect(robot.findIncorrectText, findsOneWidget);
      expect(robot.findResetButton, findsOneWidget);

      await robot.tapResetButton();

      expect(robot.findIncorrectText, findsNothing);
      expect(robot.findSubmitButton, findsOneWidget);

      await robot.tapAnswerOption('Option 1 EN');
      await robot.tapAnswerOption('Option 2 EN');
      await robot.tapAnswerOption('Option 3 EN');
      await robot.tapSubmitButton();

      expect(robot.findCorrectText, findsOneWidget);
    });
  });
}
