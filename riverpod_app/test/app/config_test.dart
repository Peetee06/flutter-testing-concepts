import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/app/config.dart';

import '../helpers/helpers.dart';

AppConfig getAppConfig() {
  return createContainer().read(appConfigProvider);
}

void main() {
  group('appConfigProvider', () {
    test('returns default AppConfig', () {
      final config = getAppConfig();

      expect(config, const AppConfig());
    });
  });
}
