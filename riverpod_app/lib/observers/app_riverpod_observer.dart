import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final class AppRiverpodObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    final timestamp = DateTime.now().toIso8601String();
    log(
      '[Riverpod][$timestamp] ${context.providerName} '
      'updated:\n'
      'Previous: $previousValue\n'
      'New: $newValue',
    );
    super.didUpdateProvider(
      context,
      previousValue,
      newValue,
    );
  }

  @override
  void didAddProvider(
    ProviderObserverContext context,
    Object? value,
  ) {
    final timestamp = DateTime.now().toIso8601String();
    log(
      '[Riverpod][$timestamp] ${context.providerName} '
      'added: $value',
    );
    super.didAddProvider(
      context,
      value,
    );
  }

  @override
  void didDisposeProvider(
    ProviderObserverContext context,
  ) {
    final timestamp = DateTime.now().toIso8601String();
    log(
      '[Riverpod][$timestamp] ${context.providerName} '
      'disposed',
    );
    super.didDisposeProvider(
      context,
    );
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    final timestamp = DateTime.now().toIso8601String();
    log(
      '[Riverpod][$timestamp] ${context.providerName} '
      'error:\n'
      'Error: $error',
      stackTrace: stackTrace,
    );
    super.providerDidFail(
      context,
      error,
      stackTrace,
    );
  }
}

extension on ProviderObserverContext {
  String get providerName => provider.name ?? provider.runtimeType.toString();
}
