import 'package:freezed_annotation/freezed_annotation.dart';

class UriJsonConverter extends JsonConverter<Uri, String> {
  const UriJsonConverter();

  @override
  Uri fromJson(String json) => Uri.parse(json);

  @override
  String toJson(Uri object) => object.toString();
}
