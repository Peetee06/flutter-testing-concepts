import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const converter = UriJsonConverter();

  group('UriJsonConverter', () {
    group('fromJson', () {
      test('should correctly parse URI strings', () {
        expect(
          converter.fromJson('https://example.com/path'),
          Uri.parse('https://example.com/path'),
        );
      });

      test('should handle URIs with query parameters', () {
        const urlString = 'https://example.com/path?param=value&second=2';
        expect(
          converter.fromJson(urlString),
          Uri.parse(urlString),
        );
      });

      test('should handle URIs with fragments', () {
        const urlString = 'https://example.com/path#section';
        expect(
          converter.fromJson(urlString),
          Uri.parse(urlString),
        );
      });

      test('should handle URIs with special characters needing encoding', () {
        const urlString = 'https://example.com/path with spaces';
        final expectedUri =
            Uri.parse('https://example.com/path%20with%20spaces');
        // Note: Uri.parse automatically encodes, so we compare with
        // encoded version
        expect(converter.fromJson(urlString), expectedUri);
      });

      test('should handle non-HTTP schemes like file', () {
        const urlString = 'file:///path/to/file';
        expect(
          converter.fromJson(urlString),
          Uri.parse(urlString),
        );
      });

      test('should handle non-HTTP schemes like tel', () {
        const urlString = 'tel:+12345678';
        expect(
          converter.fromJson(urlString),
          Uri.parse(urlString),
        );
      });

      test('should throw FormatException for missing scheme', () {
        const missingSchemeUrl = '://invalid-uri';
        expect(
          () => converter.fromJson(missingSchemeUrl),
          throwsFormatException,
        );
      });
      test('should throw FormatException on malformed port', () {
        const malformedPortUrl = 'http://[::1]:80port';

        expect(
          () => converter.fromJson(malformedPortUrl),
          throwsFormatException,
        );
      });

      test('should not double-encode already encoded URIs', () {
        const urlString = 'https://example.com/path%20with%20spaces';
        final expectedUri =
            Uri.parse('https://example.com/path%20with%20spaces');
        expect(converter.fromJson(urlString), expectedUri);
      });
    });

    group('toJson', () {
      test('should correctly convert URI to string', () {
        expect(
          converter.toJson(Uri.parse('https://example.com/path')),
          'https://example.com/path',
        );
      });

      test('should handle URIs with query parameters', () {
        final uri = Uri.parse('https://example.com/path?param=value&second=2');
        expect(
          converter.toJson(uri),
          'https://example.com/path?param=value&second=2',
        );
      });

      test('should handle URIs with fragments', () {
        final uri = Uri.parse('https://example.com/path#section');
        expect(
          converter.toJson(uri),
          'https://example.com/path#section',
        );
      });

      test('should handle URIs with special characters needing encoding', () {
        final uri = Uri.parse('https://example.com/path%20with%20spaces');
        expect(
          converter.toJson(uri),
          // Assuming Uri.toString() provides the standard representation.
          'https://example.com/path%20with%20spaces',
        );
      });

      test('should handle non-HTTP schemes like file', () {
        final uri = Uri.parse('file:///path/to/file');
        expect(
          converter.toJson(uri),
          'file:///path/to/file',
        );
      });

      test('should handle non-HTTP schemes like tel', () {
        final uri = Uri.parse('tel:+12345678');
        expect(
          converter.toJson(uri),
          'tel:+12345678',
        );
      });
    });

    group('round-trip conversion', () {
      test('should maintain URI equality after conversion cycle', () {
        const urlString = 'https://example.com/path';

        final uri = converter.fromJson(urlString);
        final jsonString = converter.toJson(uri);
        expect(jsonString, urlString);
      });

      test('should maintain URI equality after conversion cycle with encoding',
          () {
        const encodedUrl = 'https://example.com/path%20with%20spaces';
        final uri = converter.fromJson(encodedUrl);
        final round = converter.toJson(uri);
        expect(round, encodedUrl);
      });
    });
  });
}
