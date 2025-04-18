import 'package:bloc_app/features/concept/view/widgets/section_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/helpers.dart';
import '../../../../mocks.mocks.dart';

void main() {
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
    GetIt.I.registerSingleton<BaseCacheManager>(cacheManager);
  });

  tearDown(() async {
    GetIt.I.unregister<BaseCacheManager>();
  });

  testWidgets('renders text component', (tester) async {
    await tester.pumpApp(
      locale: const Locale('de'),
      widget: const ConceptSectionView(
        section: Section(
          content: [
            ContentComponent.text(text: {'en': 'Hello', 'de': 'Hallo'}),
          ],
        ),
      ),
    );
    expect(find.text('Hallo'), findsOneWidget);
  });

  testWidgets('renders image component', (tester) async {
    await tester.pumpApp(
      widget: ConceptSectionView(
        section: Section(
          content: [
            ContentComponent.image(
              imageUri: Uri.parse('https://example.com/image.jpg'),
            ),
          ],
        ),
      ),
    );
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });

  testWidgets('renders multiple components', (WidgetTester tester) async {
    await tester.pumpApp(
      widget: ConceptSectionView(
        section: Section(
          content: [
            const ContentComponent.text(text: {'en': 'Hello', 'de': 'Hallo'}),
            ContentComponent.image(
              imageUri: Uri.parse('https://example.com/image.jpg'),
            ),
          ],
        ),
      ),
    );
    expect(find.text('Hallo'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}
