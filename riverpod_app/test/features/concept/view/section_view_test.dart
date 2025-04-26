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

  group(SectionView, () {
    testWidgets('renders text component', (tester) async {
      await tester.pumpApp(
        widget: const SectionView(
          section: Section(
            content: [
              ContentComponent.text(text: {'en': 'Hello', 'de': 'Hallo'}),
            ],
          ),
        ),
        overrides: [
          cacheManagerProvider.overrideWith((ref) => cacheManager),
        ],
      );
      expect(find.text('Hallo'), findsOneWidget);
    });

    testWidgets('renders image component', (tester) async {
      await tester.pumpApp(
        widget: SectionView(
          section: Section(
            content: [
              ContentComponent.image(
                imageUri: Uri.parse('https://example.com/image.jpg'),
              ),
            ],
          ),
        ),
        overrides: [
          cacheManagerProvider.overrideWith((ref) => cacheManager),
        ],
      );
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });

    testWidgets('renders multiple components', (tester) async {
      await tester.pumpApp(
        widget: SectionView(
          section: Section(
            content: [
              const ContentComponent.text(text: {'en': 'Hello', 'de': 'Hallo'}),
              ContentComponent.image(
                imageUri: Uri.parse('https://example.com/image.jpg'),
              ),
            ],
          ),
        ),
        overrides: [
          cacheManagerProvider.overrideWith((ref) => cacheManager),
        ],
      );
      expect(find.text('Hallo'), findsOneWidget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
    });
  });
}
