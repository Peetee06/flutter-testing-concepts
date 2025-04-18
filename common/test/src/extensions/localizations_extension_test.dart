import 'package:common/src/extensions/localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocalizationsExtension', () {
    final localizations = <String, String>{
      'en': 'English text',
      'de': 'Deutscher text',
    };

    group('localizedTo', () {
      testWidgets('returns english text for english locale',
          (WidgetTester tester) async {
        await tester.pumpApp(
          Container(),
          locale: const Locale('en'),
        );
        expect(
          localizations.localizedTo(const Locale('en')),
          'English text',
        );
      });

      testWidgets('returns german text for german locale',
          (WidgetTester tester) async {
        await tester.pumpApp(
          Container(),
          locale: const Locale('de'),
        );
        expect(
          localizations.localizedTo(const Locale('de')),
          'Deutscher text',
        );
      });

      testWidgets('falls back to german locale if translation is missing',
          (WidgetTester tester) async {
        await tester.pumpApp(
          Container(),
          locale: const Locale('es'),
        );
        expect(
          localizations.localizedTo(const Locale('es')),
          'Deutscher text',
        );
      });

      testWidgets(
          'falls back to first value if translation is missing and '
          'there is no german translation', (WidgetTester tester) async {
        final localizationsWithoutDefault = <String, String>{
          'en': 'English text',
        };
        await tester.pumpApp(
          Container(),
          locale: const Locale('fr'),
        );
        expect(
          localizationsWithoutDefault.localizedTo(const Locale('fr')),
          'English text',
        );
      });
    });
  });
}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget, {Locale? locale}) {
    return pumpWidget(
      MaterialApp(
        locale: locale,
        home: widget,
      ),
    );
  }
}
