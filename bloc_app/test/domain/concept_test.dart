import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(Concept, () {
    test('should be deserialized from JSON', () {
      const json = {
        'id': 'concept1',
        'title': {'en': 'Concept 1', 'de': 'Konzept 1'},
        'sections': [
          {
            'content': [
              {
                'type': 'text',
                'text': {'de': 'Hallo', 'en': 'Hello'},
              },
            ],
          },
        ],
        'challengeIds': ['challenge1', 'challenge2'],
      };

      final concept = Concept.fromJson(json);
      const expected = Concept(
        id: 'concept1',
        title: {'en': 'Concept 1', 'de': 'Konzept 1'},
        sections: [
          Section(
            content: [
              TextComponent(
                text: {'de': 'Hallo', 'en': 'Hello'},
              ),
            ],
          ),
        ],
        challengeIds: ['challenge1', 'challenge2'],
      );

      expect(concept, expected);
    });

    test('should throw an exception if id is missing', () {
      const json = {
        'title': {'en': 'Concept 1', 'de': 'Konzept 1'},
        'sections': <Section>[],
        'challengeIds': <String>[],
      };
      expect(
        () => Concept.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if title is missing', () {
      const json = {
        'id': 'concept1',
        'sections': <Section>[],
        'challengeIds': <String>[],
      };
      expect(
        () => Concept.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if title is not a map', () {
      const json = {
        'id': 'concept1',
        'title': 'Concept 1',
        'sections': <Section>[],
        'challengeIds': <String>[],
      };
      expect(
        () => Concept.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if sections is missing', () {
      const json = {
        'id': 'concept1',
        'title': {'en': 'Concept 1', 'de': 'Konzept 1'},
        'challengeIds': <String>[],
      };
      expect(
        () => Concept.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if challengeIds is missing', () {
      const json = {
        'id': 'concept1',
        'title': {'en': 'Concept 1', 'de': 'Konzept 1'},
        'sections': <Section>[],
      };
      expect(
        () => Concept.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });
  });
}
