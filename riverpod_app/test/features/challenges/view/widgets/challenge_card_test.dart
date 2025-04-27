import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/challenges/view/widgets/challenge_card.dart';

import '../../../../helpers/helpers.dart';

void main() {
  final challenge = Challenge(
    id: '1',
    question: {
      'en': 'What is Flutter?',
      'de': 'Was ist Flutter?',
    },
    options: [
      const Answer(
        id: 'a1',
        text: {
          'en': 'A framework',
          'de': 'Ein Framework',
        },
      ),
      const Answer(
        id: 'a2',
        text: {
          'en': 'A tool',
          'de': 'Ein Werkzeug',
        },
      ),
    ],
    correctAnswerIds: ['a1'],
  );

  group(ChallengeCard, () {
    final variant = ChallengeCardVariant();

    testWidgets(
      'displays question and options',
      variant: variant,
      (tester) async {
        final (:locale, :question, :option1, :option2) = variant.currentValue!;

        await tester.pumpApp(
          locale: locale,
          widget: ChallengeCard(challenge: challenge),
        );

        expect(find.text(question), findsOneWidget);
        expect(find.text(option1), findsOneWidget);
        expect(find.text(option2), findsOneWidget);
      },
    );
  });
}

typedef ChallengeCardVariantSignature = ({
  Locale locale,
  String question,
  String option1,
  String option2,
});

class ChallengeCardVariant extends ValueVariant<ChallengeCardVariantSignature> {
  ChallengeCardVariant()
      : super({
          (
            locale: const Locale('de'),
            question: 'Was ist Flutter?',
            option1: 'Ein Framework',
            option2: 'Ein Werkzeug',
          ),
          (
            locale: const Locale('en'),
            question: 'What is Flutter?',
            option1: 'A framework',
            option2: 'A tool',
          ),
        });

  @override
  String describeValue(ChallengeCardVariantSignature value) {
    return 'locale: ${value.locale.languageCode}';
  }
}
