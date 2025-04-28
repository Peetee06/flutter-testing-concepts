import 'package:bloc_app/features/challenges/view/widgets/challenge_card.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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

  testWidgets('ChallengeCard displays question and options', (tester) async {
    await tester.pumpApp(
      locale: const Locale('de'),
      widget: ChallengeCard(challenge: challenge),
    );

    expect(find.text('Was ist Flutter?'), findsOneWidget);
    expect(find.text('Ein Framework'), findsOneWidget);
    expect(find.text('Ein Werkzeug'), findsOneWidget);
  });
}
