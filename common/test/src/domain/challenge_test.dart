import 'package:common/src/domain/answer.dart';
import 'package:common/src/domain/challenge.dart';
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
      final expected = Challenge(
        id: 'challenge1',
        question: {
          'en': 'Choose correct answer',
          'de': 'Wähle die richtige Antwort',
        },
        options: [
          const Answer(
            id: 'answer1',
            text: {'en': 'Yes', 'de': 'Ja'},
          ),
          const Answer(
            id: 'answer2',
            text: {'en': 'No', 'de': 'Nein'},
          ),
        ],
        correctAnswerIds: ['answer1'],
      );

      expect(challenge, expected);
    });

    test('toJson includes serialized options', () {
      const mockAnswer = Answer(id: 'a1', text: {'en': 'foo', 'de': 'foo'});
      final challenge = Challenge(
        id: 'c1',
        question: {'en': 'q', 'de': 'q'},
        options: [mockAnswer],
        correctAnswerIds: ['a1'],
      );
      final json = challenge.toJson();
      expect(json, {
        'id': 'c1',
        'question': {'en': 'q', 'de': 'q'},
        'options': [
          {
            'id': 'a1',
            'text': {'en': 'foo', 'de': 'foo'},
          },
        ],
        'correctAnswerIds': ['a1'],
      });
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
      final expected = Challenge(
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

    const mockQuestionLocalizations = {
      'en': 'Test Question',
      'de': 'Testfrage',
    };
    final mockOptions = [
      const Answer(id: 'a1', text: {'en': 'Option 1'}),
      const Answer(id: 'a2', text: {'en': 'Option 2'}),
    ];

    test(
        'should throw AssertionError '
        'when correctAnswerIds contains an ID not in options', () {
      expect(
        () => Challenge(
          id: 'c1',
          question: mockQuestionLocalizations,
          options: mockOptions,
          correctAnswerIds: const ['a1', 'a3'], // 'a3' is not in options
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('should create successfully when correctAnswerIds are valid', () {
      expect(
        () => Challenge(
          id: 'c2',
          question: mockQuestionLocalizations,
          options: mockOptions,
          correctAnswerIds: const ['a1', 'a2'], // Both IDs are in options
        ),
        returnsNormally,
      );
    });

    test('should create successfully when correctAnswerIds is empty', () {
      expect(
        () => Challenge(
          id: 'c3',
          question: mockQuestionLocalizations,
          options: mockOptions,
          correctAnswerIds: const [], // Empty list is valid
        ),
        returnsNormally,
      );
    });

    test(
        'should create successfully '
        'when options is empty and correctAnswerIds is empty', () {
      expect(
        () => Challenge(
          id: 'c4',
          question: mockQuestionLocalizations,
          options: [], // Empty options list
          correctAnswerIds: [], // Empty list is valid
        ),
        returnsNormally,
      );
    });

    test(
        'should throw AssertionError '
        'when options is empty but correctAnswerIds is not', () {
      expect(
        () => Challenge(
          id: 'c5',
          question: mockQuestionLocalizations,
          options: [], // Empty options list
          correctAnswerIds: ['a1'], // Invalid ID
        ),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
