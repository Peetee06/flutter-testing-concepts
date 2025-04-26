import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_app/l10n/l10n.dart';

extension PumpApp on WidgetTester {
  static const _defaultLocale = Locale('de');
  static const _localizationsDelegates =
      AppLocalizations.localizationsDelegates;
  static const _supportedLocales = AppLocalizations.supportedLocales;

  Future<void> pumpApp({
    required Widget widget,
    List<Override> overrides = const [],
    Locale locale = _defaultLocale,
  }) {
    return pumpWidget(
      ProviderScope(
        overrides: overrides,
        child: MaterialApp(
          locale: locale,
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: _supportedLocales,
          home: widget,
        ),
      ),
    );
  }

  Future<void> pumpAppWithRouter({
    required GoRouter router,
    List<Override> overrides = const [],
    Locale locale = _defaultLocale,
  }) {
    return pumpWidget(
      ProviderScope(
        overrides: overrides,
        child: MaterialApp.router(
          locale: locale,
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: _supportedLocales,
          routerConfig: router,
        ),
      ),
    );
  }
}
