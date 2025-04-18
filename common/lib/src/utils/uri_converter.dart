import 'package:freezed_annotation/freezed_annotation.dart';

/// A JSON converter for [Uri] objects.
class UriJsonConverter extends JsonConverter<Uri, String> {
  /// Create a new [UriJsonConverter].
  const UriJsonConverter();

  @override
  Uri fromJson(String json) => Uri.parse(json);

  @override
  String toJson(Uri object) => object.toString();
}
