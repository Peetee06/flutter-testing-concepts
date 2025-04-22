import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/app/config.dart';

AppConfig getAppConfig() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container.read(appConfigProvider);
}

void main() {
  group('appConfigProvider', () {
    test('returns default AppConfig', () {
      final config = getAppConfig();

      expect(config, const AppConfig());
    });
  });
}
