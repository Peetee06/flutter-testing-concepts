import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_app/common/typedefs.dart';
import 'package:riverpod_app/common/utils/uri_converter.dart';

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
