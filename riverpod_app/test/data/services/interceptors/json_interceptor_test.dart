import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/data/services/interceptors/json_interceptor.dart';

import '../../../mocks.mocks.dart';

void main() {
  late MockResponse<dynamic> response;
  late MockResponseInterceptorHandler handler;
  late JsonInterceptor interceptor;

  setUp(() {
    response = MockResponse<dynamic>();
    handler = MockResponseInterceptorHandler();
    interceptor = JsonInterceptor();
  });

  group(JsonInterceptor, () {
    test('decodes JSON string in response data', () {
      final jsonData = {'key': 'value'};
      final jsonString = jsonEncode(jsonData);
      when(response.data).thenReturn(jsonString);

      interceptor.onResponse(response, handler);

      verify(response.data = jsonData).called(1);
      verify(handler.next(response)).called(1);
    });

    test('ignores parsing errors and calls next with original response', () {
      const invalidJsonString = 'invalid json';
      when(response.data).thenReturn(invalidJsonString);

      interceptor.onResponse(response, handler);

      verifyNever(response.data = any);
      verify(handler.next(response)).called(1);
    });

    test('handles non-string data and calls next with original response', () {
      final mapData = {'key': 'value'};
      when(response.data).thenReturn(mapData);

      interceptor.onResponse(response, handler);

      verifyNever(response.data = any);
      verify(handler.next(response)).called(1);
    });
  });
}
