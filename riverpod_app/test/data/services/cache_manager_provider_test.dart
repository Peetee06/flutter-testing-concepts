import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/data/services/cache_manager_provider.dart';

import '../../helpers/helpers.dart';

void main() {
  group('cacheManagerProvider', () {
    test('returns null', () {
      final cacheManager = createContainer().read(cacheManagerProvider);
      expect(cacheManager, isNull);
    });
  });
}
