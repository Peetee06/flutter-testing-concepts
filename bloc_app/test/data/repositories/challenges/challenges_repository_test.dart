import 'package:bloc_app/data/repositories/challenges/challenges_repository.dart';
import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  late MockRestClient restClient;

  setUp(() {
    restClient = MockRestClient();
  });

  group(ChallengesRepository, () {
    test('getChallenges returns a list of challenges', () async {
      when(restClient.getChallenges()).thenAnswer(
        (_) async => [
          Challenge(
            id: '1',
            question: {
              'en': 'What is the capital of France?',
              'de': 'Was ist die Hauptstadt von Frankreich?',
            },
            options: [
              const Answer(id: 'a1', text: {'en': 'Paris', 'de': 'Paris'}),
              const Answer(id: 'a2', text: {'en': 'London', 'de': 'London'}),
              const Answer(id: 'a3', text: {'en': 'Berlin', 'de': 'Berlin'}),
            ],
            correctAnswerIds: ['a1'],
          ),
          Challenge(
            id: '2',
            question: {
              'en': 'Which colors are in the German flag?',
              'de': 'Welche Farben sind in der deutschen Flagge?',
            },
            options: [
              const Answer(id: 'b1', text: {'en': 'Black', 'de': 'Schwarz'}),
              const Answer(id: 'b2', text: {'en': 'Red', 'de': 'Rot'}),
              const Answer(id: 'b3', text: {'en': 'Gold', 'de': 'Gold'}),
            ],
            correctAnswerIds: ['b1', 'b2', 'b3'],
          ),
        ],
      );
      final repository = ChallengesRepository(
        restClient: restClient,
      );

      final challenges = await repository.getChallenges();

      expect(
        challenges,
        [
          Challenge(
            id: '1',
            question: {
              'en': 'What is the capital of France?',
              'de': 'Was ist die Hauptstadt von Frankreich?',
            },
            options: [
              const Answer(id: 'a1', text: {'en': 'Paris', 'de': 'Paris'}),
              const Answer(id: 'a2', text: {'en': 'London', 'de': 'London'}),
              const Answer(id: 'a3', text: {'en': 'Berlin', 'de': 'Berlin'}),
            ],
            correctAnswerIds: ['a1'],
          ),
          Challenge(
            id: '2',
            question: {
              'en': 'Which colors are in the German flag?',
              'de': 'Welche Farben sind in der deutschen Flagge?',
            },
            options: [
              const Answer(id: 'b1', text: {'en': 'Black', 'de': 'Schwarz'}),
              const Answer(id: 'b2', text: {'en': 'Red', 'de': 'Rot'}),
              const Answer(id: 'b3', text: {'en': 'Gold', 'de': 'Gold'}),
            ],
            correctAnswerIds: ['b1', 'b2', 'b3'],
          ),
        ],
      );
    });
  });
}
