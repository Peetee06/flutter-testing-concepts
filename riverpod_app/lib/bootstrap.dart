import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
