// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get conceptsViewTitle => 'Konzepte';

  @override
  String conceptsSections(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Abschnitte',
      one: 'ein Abschnitt',
      zero: 'keine Abschnitte',
    );
    return '$_temp0';
  }

  @override
  String conceptsChallenges(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Herausforderungen',
      one: 'eine Herausforderung',
      zero: 'keine Herausforderungen',
    );
    return '$_temp0';
  }

  @override
  String get conceptsTryAgain => 'Nochmal versuchen';

  @override
  String get conceptsEmpty => 'Keine Konzepte gefunden';

  @override
  String get sectionsEmpty => 'Keine Abschnitte';

  @override
  String get challengesEmpty =>
      'Keine Herausforderungen für dieses Konzept verfügbar.';

  @override
  String get challengesDoneButtonLabel => 'Fertig';
}
