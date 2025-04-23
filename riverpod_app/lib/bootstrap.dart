import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Bootstraps the application with Riverpod integration.
///
/// [builder] Creates the root widget of the application.
/// [observers] Optional list of [ProviderObserver]s for monitoring Riverpod providers.
Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
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
