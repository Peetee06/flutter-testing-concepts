import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/data/services/cache_manager_provider.dart';
import 'package:riverpod_app/features/challenges/view/challenges_view.dart';
import 'package:riverpod_app/features/concept/view/concept_view.dart';
import 'package:riverpod_app/features/concepts/view/concepts_view.dart';

import './challenges_robot.dart';
import './mocks.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late MockBaseCacheManager cacheManager;

  setUp(() {
    cacheManager = MockBaseCacheManager();
    when(
      cacheManager.getFileStream(
        any,
        key: anyNamed('key'),
        headers: anyNamed('headers'),
        withProgress: anyNamed('withProgress'),
      ),
    ).thenAnswer((_) => const Stream<FileResponse>.empty());
  });

  group('App Integration Test', () {
    testWidgets('Concept flow', (WidgetTester tester) async {
      final robot = ChallengesRobot(
        tester,
        overrides: [cacheManagerProvider.overrideWithValue(cacheManager)],
      );
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
      final robot = ChallengesRobot(
        tester,
        overrides: [cacheManagerProvider.overrideWithValue(cacheManager)],
      );
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
