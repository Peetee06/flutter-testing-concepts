import 'package:bloc_app/domain/answer.dart';
import 'package:bloc_app/domain/challenge.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(Challenge, () {
    test('should be deserialized from JSON', () {
      const json = {
        'id': 'challenge1',
        'question': {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        'options': [
          {
            'id': 'answer1',
            'text': {'en': 'Yes', 'de': 'Ja'},
          },
          {
            'id': 'answer2',
            'text': {'en': 'No', 'de': 'Nein'},
          },
        ],
        'correctAnswerIds': ['answer1'],
      };

      final challenge = Challenge.fromJson(json);
      const expected = Challenge(
        id: 'challenge1',
        question: {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        options: [
          Answer(
            id: 'answer1',
            text: {'en': 'Yes', 'de': 'Ja'},
          ),
          Answer(
            id: 'answer2',
            text: {'en': 'No', 'de': 'Nein'},
          ),
        ],
        correctAnswerIds: ['answer1'],
      );

      expect(challenge, expected);
    });

    test('should throw an exception if id is missing', () {
      const json = {
        'question': {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        'options': <Answer>[],
        'correctAnswerIds': <String>[],
      };
      expect(
        () => Challenge.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if title is missing', () {
      const json = {
        'id': 'challenge1',
        'options': <Answer>[],
        'correctAnswerIds': <String>[],
      };
      expect(
        () => Challenge.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if options is missing', () {
      const json = {
        'id': 'challenge1',
        'question': {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        'correctAnswerIds': <String>[],
      };
      expect(
        () => Challenge.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if correctAnswerIds is missing', () {
      const json = {
        'id': 'challenge1',
        'question': {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        'options': <Answer>[],
      };
      expect(
        () => Challenge.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should handle empty options and correctAnswerIds lists', () {
      const json = {
        'id': 'challenge1',
        'question': {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        'options': <Answer>[],
        'correctAnswerIds': <String>[],
      };

      final challenge = Challenge.fromJson(json);
      const expected = Challenge(
        id: 'challenge1',
        question: {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        options: [],
        correctAnswerIds: [],
      );

      expect(challenge, expected);
    });
  });
}
