import 'package:common/src/domain/answer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(Answer, () {
    test('should be deserialized from JSON', () {
      const json = {
        'id': 'answer1',
        'text': {'en': 'Yes', 'de': 'Ja'},
      };

      final answer = Answer.fromJson(json);
      const expected = Answer(
        id: 'answer1',
        text: {'en': 'Yes', 'de': 'Ja'},
      );

      expect(answer, expected);
    });

    test('should be serialized to JSON correctly', () {
      const answer = Answer(
        id: 'answer1',
        text: {'en': 'Yes', 'de': 'Ja'},
      );

      final json = answer.toJson();

      expect(json, {
        'id': 'answer1',
        'text': {'en': 'Yes', 'de': 'Ja'},
      });
    });

    test('should maintain Answer equality after conversion cycle', () {
      const originalAnswer = Answer(
        id: 'answer1',
        text: {'en': 'Yes', 'de': 'Ja'},
      );

      final json = originalAnswer.toJson();
      final deserializedAnswer = Answer.fromJson(json);

      expect(deserializedAnswer, originalAnswer);
    });

    test('should throw an exception if id is missing', () {
      const json = {
        'text': {'en': 'Yes', 'de': 'Ja'},
      };
      expect(
        () => Answer.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if text is missing', () {
      const json = {
        'id': 'answer1',
      };
      expect(
        () => Answer.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
