import 'package:bloc_app/domain/answer.dart';
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
