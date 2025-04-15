import 'package:bloc_app/common/typedefs.dart';
import 'package:bloc_app/common/utils/uri_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_component.freezed.dart';
part 'content_component.g.dart';

@Freezed(unionKey: 'type')
sealed class ContentComponent with _$ContentComponent {
  const factory ContentComponent.image({
    @UriJsonConverter() required Uri imageUri,
  }) = ImageComponent;

  const factory ContentComponent.text({
    required Localizations text,
  }) = TextComponent;

  factory ContentComponent.fromJson(Map<String, dynamic> json) =>
      _$ContentComponentFromJson(json);
}
