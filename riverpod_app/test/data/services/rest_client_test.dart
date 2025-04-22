import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
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
    late MockDio dio;

    setUp(() {
      dio = MockDio();
    });

    RestClient getRestClient() {
      final container = ProviderContainer(
        overrides: [
          dioProvider.overrideWithValue(dio),
        ],
      );
      addTearDown(container.dispose);
      return container.read(restClientProvider);
    }

    test('should use the provided Dio instance for API calls', () async {
      final client = getRestClient();

      when(dio.options).thenReturn(BaseOptions());
      when(dio.fetch<List<dynamic>>(any)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          data: [],
          statusCode: 200,
        ),
      );

      await client.getConcepts();
      verify(dio.fetch<List<dynamic>>(any)).called(1);

      await client.getChallenges();
      verify(dio.fetch<List<dynamic>>(any)).called(1);
    });
  });
}
