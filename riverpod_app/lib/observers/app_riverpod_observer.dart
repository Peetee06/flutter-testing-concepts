import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppRiverpodObserver extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    log('[Riverpod] ${provider.name ?? provider.runtimeType} updated: $previousValue -> $newValue');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    log('[Riverpod] ${provider.name ?? provider.runtimeType} added: $value');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    log('[Riverpod] ${provider.name ?? provider.runtimeType} disposed');
    super.didDisposeProvider(provider, container);
  }

  @override
  void providerDidFail(ProviderBase provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    log('[Riverpod] ${provider.name ?? provider.runtimeType} error: $error',
        stackTrace: stackTrace);
    super.providerDidFail(provider, error, stackTrace, container);
  }
}
