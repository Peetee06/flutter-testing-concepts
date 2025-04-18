import 'package:common/src/typedefs.dart';
import 'package:common/src/utils/uri_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_component.freezed.dart';
part 'content_component.g.dart';

@Freezed(unionKey: 'type')

/// A content component.
sealed class ContentComponent with _$ContentComponent {
  /// Create an image component.
  const factory ContentComponent.image({
    @UriJsonConverter() required Uri imageUri,
  }) = ImageComponent;

  /// Create a text component.
  const factory ContentComponent.text({
    required Localizations text,
  }) = TextComponent;

  /// Deserialize a content component from a JSON object.
  factory ContentComponent.fromJson(Map<String, dynamic> json) =>
      _$ContentComponentFromJson(json);
}
