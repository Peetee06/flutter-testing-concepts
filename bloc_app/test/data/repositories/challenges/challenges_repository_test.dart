import 'package:bloc_app/data/repositories/challenges/challenges_repository.dart';
import 'package:bloc_app/domain/answer.dart';
import 'package:bloc_app/domain/challenge.dart';
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
          const Challenge(
            id: '1',
            question: {
              'en': 'What is the capital of France?',
              'de': 'Was ist die Hauptstadt von Frankreich?',
            },
            options: [
              Answer(id: 'a1', text: {'en': 'Paris', 'de': 'Paris'}),
              Answer(id: 'a2', text: {'en': 'London', 'de': 'London'}),
              Answer(id: 'a3', text: {'en': 'Berlin', 'de': 'Berlin'}),
            ],
            correctAnswerIds: ['a1'],
          ),
          const Challenge(
            id: '2',
            question: {
              'en': 'Which colors are in the German flag?',
              'de': 'Welche Farben sind in der deutschen Flagge?',
            },
            options: [
              Answer(id: 'b1', text: {'en': 'Black', 'de': 'Schwarz'}),
              Answer(id: 'b2', text: {'en': 'Red', 'de': 'Rot'}),
              Answer(id: 'b3', text: {'en': 'Gold', 'de': 'Gold'}),
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
          const Challenge(
            id: '1',
            question: {
              'en': 'What is the capital of France?',
              'de': 'Was ist die Hauptstadt von Frankreich?',
            },
            options: [
              Answer(id: 'a1', text: {'en': 'Paris', 'de': 'Paris'}),
              Answer(id: 'a2', text: {'en': 'London', 'de': 'London'}),
              Answer(id: 'a3', text: {'en': 'Berlin', 'de': 'Berlin'}),
            ],
            correctAnswerIds: ['a1'],
          ),
          const Challenge(
            id: '2',
            question: {
              'en': 'Which colors are in the German flag?',
              'de': 'Welche Farben sind in der deutschen Flagge?',
            },
            options: [
              Answer(id: 'b1', text: {'en': 'Black', 'de': 'Schwarz'}),
              Answer(id: 'b2', text: {'en': 'Red', 'de': 'Rot'}),
              Answer(id: 'b3', text: {'en': 'Gold', 'de': 'Gold'}),
            ],
            correctAnswerIds: ['b1', 'b2', 'b3'],
          ),
        ],
      );
    });
  });
}
