import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/utils/retry.dart';

void main() {
  group('networkRetry', () {
    group('retry attempts', () {
      test('returns exponentially increasing durations', () {
        final error = DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(),
        );

        final expectedDurations = {
          0: const Duration(milliseconds: 200),
          1: const Duration(milliseconds: 400),
          2: const Duration(milliseconds: 800),
          3: const Duration(milliseconds: 1600),
          4: const Duration(milliseconds: 3200),
        };

        for (final entry in expectedDurations.entries) {
          expect(
            networkRetry(entry.key, error),
            entry.value,
            reason: 'retry count ${entry.key}',
          );
        }
      });

      test('returns null when max retry attempts reached or exceeded', () {
        final error = DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: RequestOptions(),
        );

        for (final retryCount in [5, 10, 100]) {
          expect(
            networkRetry(retryCount, error),
            isNull,
            reason: 'retry count $retryCount',
          );
        }
      });
    });

    group('retryable errors', () {
      test('retries on transient DioException types', () {
        final retryableTypes = [
          DioExceptionType.connectionTimeout,
          DioExceptionType.sendTimeout,
          DioExceptionType.receiveTimeout,
          DioExceptionType.connectionError,
        ];

        for (final type in retryableTypes) {
          final result = networkRetry(
            0,
            DioException(type: type, requestOptions: RequestOptions()),
          );
          expect(result, isNotNull, reason: type.name);
        }
      });

      test('retries on server errors (5xx)', () {
        final serverErrorCodes = [500, 502, 503, 504];

        for (final statusCode in serverErrorCodes) {
          final result = networkRetry(
            0,
            DioException(
              type: DioExceptionType.badResponse,
              response: Response(
                statusCode: statusCode,
                requestOptions: RequestOptions(),
              ),
              requestOptions: RequestOptions(),
            ),
          );
          expect(result, isNotNull, reason: 'status code $statusCode');
        }
      });
    });

    group('non-retryable errors', () {
      test('does not retry on client errors (4xx)', () {
        final clientErrorCodes = [400, 401, 403, 404, 422];

        for (final statusCode in clientErrorCodes) {
          final result = networkRetry(
            0,
            DioException(
              type: DioExceptionType.badResponse,
              response: Response(
                statusCode: statusCode,
                requestOptions: RequestOptions(),
              ),
              requestOptions: RequestOptions(),
            ),
          );
          expect(result, isNull, reason: 'status code $statusCode');
        }
      });

      test('does not retry on non-transient DioException types', () {
        final nonRetryableTypes = [
          DioExceptionType.cancel,
          DioExceptionType.badCertificate,
          DioExceptionType.unknown,
        ];

        for (final type in nonRetryableTypes) {
          final result = networkRetry(
            0,
            DioException(type: type, requestOptions: RequestOptions()),
          );
          expect(result, isNull, reason: type.name);
        }
      });

      test('does not retry on non-DioException errors', () {
        final nonDioErrors = [
          Exception('some error'),
          const FormatException('parse error'),
          StateError('state error'),
          TypeError(),
        ];

        for (final error in nonDioErrors) {
          final result = networkRetry(0, error);
          expect(result, isNull, reason: error.runtimeType.toString());
        }
      });

      test('does not retry on badResponse with missing status code', () {
        final edgeCases = [
          DioException(
            type: DioExceptionType.badResponse,
            response: Response(requestOptions: RequestOptions()),
            requestOptions: RequestOptions(),
          ),
          DioException(
            type: DioExceptionType.badResponse,
            requestOptions: RequestOptions(),
          ),
        ];

        for (final error in edgeCases) {
          final result = networkRetry(0, error);
          expect(
            result,
            isNull,
            reason:
                error.response == null ? 'null response' : 'null statusCode',
          );
        }
      });
    });
  });
}
