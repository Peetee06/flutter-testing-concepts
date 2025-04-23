import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/data/services/cache_manager_provider.dart';

void main() {
  group('cacheManagerProvider', () {
    test('returns null', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final cacheManager = container.read(cacheManagerProvider);
      expect(cacheManager, isNull);
    });
  });
}
