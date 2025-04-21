import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/app/config.dart';
import 'package:riverpod_app/data/services/interceptors/json_interceptor.dart';
import 'package:riverpod_app/data/services/rest_client.dart';

import '../../mocks.mocks.dart';

void main() {
  group('dioProvider', () {
    Dio getDio({required AppConfig config}) {
      final container = ProviderContainer(
        overrides: [
          appConfigProvider.overrideWithValue(config),
        ],
      );
      addTearDown(container.dispose);
      return container.read(dioProvider);
    }

    test('should create Dio instance with correct base URL and interceptor',
        () {
      const config = AppConfig(baseUrl: 'http://mock.com');
      final dio = getDio(config: config);

      expect(
        dio,
        isA<Dio>()
            .having(
              (dio) => dio.options.baseUrl,
              'baseUrl',
              config.baseUrl,
            )
            .having(
              (dio) => dio.interceptors,
              'interceptors',
              contains(isA<JsonInterceptor>()),
            ),
      );
    });
  });

  group('restClientProvider', () {
    late MockDio mockDio;

    setUp(() {
      mockDio = MockDio();
    });

    RestClient getRestClient() {
      final container = ProviderContainer(
        overrides: [
          dioProvider.overrideWithValue(mockDio),
        ],
      );
      addTearDown(container.dispose);
      return container.read(restClientProvider);
    }

    test('should create RestClient instance', () {
      final client = getRestClient();
      expect(client, isA<RestClient>());
    });
  });
}
