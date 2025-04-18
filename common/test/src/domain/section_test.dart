import 'package:common/src/domain/content_component.dart';
import 'package:common/src/domain/section.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(Section, () {
    test('should be deserialized from JSON', () {
      const json = {
        'content': [
          {
            'type': 'text',
            'text': {'de': 'Hallo', 'en': 'Hello'},
          },
          {
            'type': 'image',
            'imageUri': 'https://example.com/image.png',
          },
        ],
      };

      final section = Section.fromJson(json);
      final expected = Section(
        content: [
          const TextComponent(
            text: {'de': 'Hallo', 'en': 'Hello'},
          ),
          ImageComponent(
            imageUri: Uri.parse('https://example.com/image.png'),
          ),
        ],
      );

      expect(section, expected);
    });

    test('should throw an exception if content is missing', () {
      const json = <String, dynamic>{};
      expect(
        () => Section.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should throw an exception if content is not a list', () {
      const json = {'content': 'not_a_list'};
      expect(
        () => Section.fromJson(json),
        throwsA(isA<TypeError>()),
      );
    });

    test('should handle empty content list', () {
      const json = {'content': <ContentComponent>[]};
      final section = Section.fromJson(json);
      expect(section.content, isEmpty);
    });
  });
}
