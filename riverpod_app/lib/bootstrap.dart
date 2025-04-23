import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Bootstraps the application with Riverpod integration.
///
/// Example:
/// ```dart
/// await bootstrap(
///   () => const App(),
///   observers: [AppRiverpodObserver()],
/// );
/// ```
Future<void> bootstrap(
  /// Creates the root widget of the application.
  FutureOr<Widget> Function() builder, {
  /// Optional list of [ProviderObserver]s for monitoring Riverpod providers.
  List<ProviderObserver>? observers,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runApp(
    ProviderScope(
      observers: observers ?? const [],
      child: await builder(),
    ),
  );
}
