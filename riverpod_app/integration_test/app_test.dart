import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/app/view/app.dart';
import 'package:riverpod_app/data/services/cache_manager_provider.dart';
import 'package:riverpod_app/features/challenges/view/challenges_view.dart';
import 'package:riverpod_app/features/challenges/view/widgets/challenges_list.dart';
import 'package:riverpod_app/features/concept/view/concept_view.dart';
import 'package:riverpod_app/features/concept/view/widgets/sections_view.dart';
import 'package:riverpod_app/features/concepts/view/concepts_view.dart';

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
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            cacheManagerProvider.overrideWithValue(cacheManager),
          ],
          child: const App(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ConceptsView), findsOneWidget);

      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();

      expect(find.byType(ConceptView), findsOneWidget);

      await tester.tap(find.byKey(SectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(SectionsView.forwardButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(SectionsView.forwardButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(ChallengesView), findsOneWidget);

      await tester.tap(find.byKey(ChallengesList.doneButtonKey));
      await tester.pumpAndSettle();

      expect(find.byType(ConceptsView), findsOneWidget);
    });
  });
}
