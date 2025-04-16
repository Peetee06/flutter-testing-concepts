import 'dart:ui';

import 'package:riverpod_app/common/typedefs.dart';

extension LocalizationsExtension on Localizations {
  /// Returns the localized string for the given locale.
  /// Falls back to German ('de') if the requested language is not available,
  /// or to the first available localization if German is also not available.
  String localizedTo(Locale locale) {
    return this[locale.languageCode] ?? this['de'] ?? values.first;
  }
}
