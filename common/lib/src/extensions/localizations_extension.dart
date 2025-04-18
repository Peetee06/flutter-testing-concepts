import 'dart:ui';

import 'package:common/src/typedefs.dart';

/// Extensions on [Localizations].
extension LocalizationsExtension on Localizations {
  /// Get the localized string for the given locale.
  ///
  /// If the locale is not found, the default locale 'de' is used.
  /// If the default locale is not found, the first value is used.
  String localizedTo(Locale locale) {
    return this[locale.languageCode] ?? this['de'] ?? values.first;
  }
}
