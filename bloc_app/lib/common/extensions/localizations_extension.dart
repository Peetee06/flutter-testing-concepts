import 'dart:ui';

import 'package:bloc_app/common/typedefs.dart';

extension LocalizationsExtension on Localizations {
  String localizedTo(Locale locale) {
    return this[locale.languageCode] ?? this['de'] ?? values.first;
  }
}
