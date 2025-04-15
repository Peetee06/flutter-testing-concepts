import 'package:bloc_app/data/services/interceptors/json_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  late JsonInterceptor interceptor;
  late MockHttpClientAdapter adapter;
  late Dio dio;

  setUp(() {
    interceptor = JsonInterceptor();
    adapter = MockHttpClientAdapter();
    dio = Dio()
      ..httpClientAdapter = adapter
      ..interceptors.add(interceptor);
  });

  ResponseBody setupTestResponseBody(
    String data, {
    String contentType = 'text/plain',
  }) {
    final responseBody = ResponseBody.fromString(
      data,
      200,
      headers: {
        'Content-Type': [contentType],
      },
    );
    when(adapter.fetch(any, any, any)).thenAnswer((_) async => responseBody);
    return responseBody;
  }

  Future<Response<dynamic>> getTestResponse() async {
    return dio.get<dynamic>('/');
  }

  group('JsonInterceptor', () {
    test('should parse text/plain response as JSON', () async {
      setupTestResponseBody('{"key": "value", "number": 42}');

      final result = await getTestResponse();

      expect(
        result.data,
        {
          'key': 'value',
          'number': 42,
        },
      );
    });

    test('should return original response if parsing fails', () async {
      setupTestResponseBody('{invalid json}');

      final result = await getTestResponse();

      expect(result.data, '{invalid json}');
    });

    test('should parse application/json response', () async {
      setupTestResponseBody(
        '{"already": "parsed"}',
        contentType: 'application/json',
      );

      final result = await getTestResponse();

      expect(result.data, {'already': 'parsed'});
    });
  });
}
