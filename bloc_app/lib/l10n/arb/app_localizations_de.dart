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
  String get conceptSectionEmpty => 'Keine Abschnitte verfügbar';

  @override
  String get conceptSectionForwardButtonLabel => 'Weiter';

  @override
  String get conceptSectionBackButtonLabel => 'Zurück';

  @override
  String get challengesEmpty => 'Keine Herausforderungen verfügbar';

  @override
  String get challengesDoneButtonLabel => 'Fertig';

  @override
  String get submit => 'Absenden';

  @override
  String get correct => 'Richtig!';

  @override
  String get incorrect => 'Falsch';

  @override
  String get tryAgain => 'Nochmal';
}
