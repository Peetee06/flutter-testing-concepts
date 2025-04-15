import 'package:bloc_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

extension PumpApp on WidgetTester {
  static const _locale = Locale('de');
  static const _localizationsDelegates =
      AppLocalizations.localizationsDelegates;
  static const _supportedLocales = AppLocalizations.supportedLocales;

  Future<void> pumpApp({
    required Widget widget,
    Locale? locale,
  }) async {
    await pumpWidget(
      MaterialApp(
        locale: locale ?? _locale,
        localizationsDelegates: _localizationsDelegates,
        supportedLocales: _supportedLocales,
        home: widget,
      ),
    );
  }

  Future<void> pumpAppWithRouter({
    required GoRouter router,
    Locale? locale,
  }) async {
    await pumpWidget(
      MaterialApp.router(
        locale: locale ?? _locale,
        localizationsDelegates: _localizationsDelegates,
        supportedLocales: _supportedLocales,
        routerConfig: router,
      ),
    );
  }
}
