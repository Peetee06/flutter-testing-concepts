import 'package:common/src/utils/uri_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const converter = UriJsonConverter();

  group('UriJsonConverter', () {
    test('fromJson should correctly parse URI strings', () {
      expect(
        converter.fromJson('https://example.com/path'),
        Uri.parse('https://example.com/path'),
      );
    });

    test('toJson should correctly convert URI to string', () {
      expect(
        converter.toJson(Uri.parse('https://example.com/path')),
        'https://example.com/path',
      );
    });

    test('should maintain URI equality after conversion cycle', () {
      const urlString = 'https://example.com/path';

      final uri = converter.fromJson(urlString);
      final jsonString = converter.toJson(uri);
      expect(jsonString, urlString);
    });
  });
}
