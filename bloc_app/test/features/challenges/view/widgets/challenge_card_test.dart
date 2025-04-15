import 'package:bloc_app/domain/answer.dart';
import 'package:bloc_app/domain/challenge.dart';
import 'package:bloc_app/features/challenges/view/widgets/challenge_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/helpers.dart';

void main() {
  const challenge = Challenge(
    id: '1',
    question: {
      'en': 'What is Flutter?',
      'de': 'Was ist Flutter?',
    },
    options: [
      Answer(
        id: 'a1',
        text: {
          'en': 'A framework',
          'de': 'Ein Framework',
        },
      ),
      Answer(
        id: 'a2',
        text: {
          'en': 'A tool',
          'de': 'Ein Werkzeug',
        },
      ),
    ],
    correctAnswerIds: ['a1'],
  );

  testWidgets('ChallengeCard displays question and options', (tester) async {
    await tester.pumpApp(
      locale: const Locale('de'),
      widget: const Material(
        child: ChallengeCard(challenge: challenge),
      ),
    );

    expect(find.text('Was ist Flutter?'), findsOneWidget);
    expect(find.text('Ein Framework'), findsOneWidget);
    expect(find.text('Ein Werkzeug'), findsOneWidget);
  });
}
