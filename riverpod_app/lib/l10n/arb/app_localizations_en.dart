// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get conceptsViewTitle => 'Concepts';

  @override
  String conceptsSections(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sections',
      one: 'one section',
      zero: 'no sections',
    );
    return '$_temp0';
  }

  @override
  String conceptsChallenges(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count challenges',
      one: 'one challenge',
      zero: 'no challenges',
    );
    return '$_temp0';
  }

  @override
  String get conceptsTryAgain => 'Try again';

  @override
  String get conceptsEmpty => 'No concepts found';

  @override
  String get sectionsEmpty => 'No sections';

  @override
  String get challengesEmpty => 'No challenges available for this concept.';

  @override
  String get challengesDoneButtonLabel => 'Done';
}
