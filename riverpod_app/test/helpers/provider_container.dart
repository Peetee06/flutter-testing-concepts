import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/utils/disable_retry.dart';

/// Creates a [ProviderContainer] with retry disabled for testing.
///
/// The container is automatically disposed when the test completes.
ProviderContainer createContainer({
  List<Override> overrides = const [],
}) {
  return ProviderContainer.test(
    retry: disableRetry,
    overrides: overrides,
  );
}
