import 'package:bloc_app/domain/content_component.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

void main() {
  group(ContentComponent, () {
    group('image', () {
      test('should be deserialized from JSON', () {
        const json = {
          'type': 'image',
          'imageUri': 'https://example.com/image.png',
        };
        final component = ContentComponent.fromJson(json);
        final expected = ImageComponent(
          imageUri: Uri.parse('https://example.com/image.png'),
        );
        expect(component, expected);
      });
    });

    group('text', () {
      test('should be deserialized from JSON', () {
        const json = {
          'type': 'text',
          'text': {'de': 'Hallo', 'en': 'Hello'},
        };
        final component = ContentComponent.fromJson(json);
        const expected = TextComponent(
          text: {'de': 'Hallo', 'en': 'Hello'},
        );
        expect(component, expected);
      });

      test('should throw an exception if the text is missing', () {
        const json = {'type': 'text'};
        expect(
          () => ContentComponent.fromJson(json),
          throwsA(isA<TypeError>()),
        );
      });
    });

    test('should throw an exception if the type is invalid', () {
      const json = {'type': 'invalid_type'};
      expect(
        () => ContentComponent.fromJson(json),
        throwsA(isA<CheckedFromJsonException>()),
      );
    });
  });
}
