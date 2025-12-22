import 'package:dio/dio.dart';

/// Maximum number of retry attempts before giving up.
const int maxRetryAttempts = 5;

/// Base delay in milliseconds for exponential backoff.
const int baseDelayMs = 200;

/// Retry function with exponential backoff for network-related errors.
///
/// Returns a [Duration] to wait before the next retry, or `null` to stop
/// retrying.
///
/// This function implements exponential backoff starting at [baseDelayMs]
/// and doubling with each attempt.
///
/// Retries are only performed for transient network errors that may succeed
/// on retry. Non-retryable errors (e.g., 4xx client errors, validation errors)
/// return `null` immediately to prevent unnecessary retries.
Duration? networkRetry(int retryCount, Object error) {
  if (retryCount >= maxRetryAttempts) return null;

  if (!_isRetryableError(error)) return null;

  return Duration(milliseconds: baseDelayMs * (1 << retryCount));
}

/// Determines whether an error is retryable.
///
/// Returns `true` for transient network errors that may succeed on retry:
/// - Connection timeouts
/// - Send/receive timeouts
/// - Connection errors (no internet, DNS failures, etc.)
/// - Server errors (5xx status codes)
///
/// Returns `false` for non-retryable errors:
/// - Client errors (4xx status codes)
/// - Request cancellation
/// - Bad responses that indicate invalid requests
/// - Non-DioException errors (e.g., parsing errors, business logic errors)
bool _isRetryableError(Object error) {
  if (error is! DioException) return false;

  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
      return true;
    case DioExceptionType.badResponse:
      final statusCode = error.response?.statusCode;
      if (statusCode == null) return false;
      // Only retry server errors (5xx), not client errors (4xx)
      return statusCode >= 500 && statusCode < 600;
    case DioExceptionType.cancel:
    case DioExceptionType.badCertificate:
    case DioExceptionType.unknown:
      return false;
  }
}
