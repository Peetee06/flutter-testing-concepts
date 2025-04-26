import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/data/services/cache_manager_provider.dart';
import 'package:riverpod_app/features/concept/view/widgets/section_view.dart';

import '../../../helpers/pump_app.dart';
import '../../../mocks.mocks.dart';

void main() {
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

  Future<void> pumpSectionView(
    WidgetTester tester, {
    required Section section,
  }) async {
    await tester.pumpApp(
      widget: SectionView(section: section),
      overrides: [
        cacheManagerProvider.overrideWith((_) => cacheManager),
      ],
    );
  }

  group(SectionView, () {
    testWidgets('renders text component', (tester) async {
      await pumpSectionView(
        tester,
        section: const Section(
          content: [
            ContentComponent.text(text: {'en': 'Hello', 'de': 'Hallo'}),
          ],
        ),
      );
      // default locale is de
      expect(find.text('Hallo'), findsOneWidget);
    });

    testWidgets('renders image component', (tester) async {
      await pumpSectionView(
        tester,
        section: Section(
          content: [
            ContentComponent.image(
              imageUri: Uri.parse('https://example.com/image.jpg'),
            ),
          ],
        ),
      );
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('renders multiple components', (tester) async {
      await pumpSectionView(
        tester,
        section: Section(
          content: [
            const ContentComponent.text(text: {'en': 'Hello', 'de': 'Hallo'}),
            ContentComponent.image(
              imageUri: Uri.parse('https://example.com/image.jpg'),
            ),
          ],
        ),
      );
      // default locale is de
      expect(find.text('Hallo'), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('handles empty content gracefully', (tester) async {
      await pumpSectionView(
        tester,
        section: const Section(content: []),
      );

      expect(find.byType(SectionView), findsOneWidget);
    });
  });
}
