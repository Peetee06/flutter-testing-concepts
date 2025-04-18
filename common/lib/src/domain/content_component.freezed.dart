// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ContentComponent _$ContentComponentFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'image':
      return ImageComponent.fromJson(json);
    case 'text':
      return TextComponent.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ContentComponent',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$ContentComponent {
  /// Serializes this ContentComponent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ContentComponent);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ContentComponent()';
  }
}

/// @nodoc
class $ContentComponentCopyWith<$Res> {
  $ContentComponentCopyWith(
      ContentComponent _, $Res Function(ContentComponent) __);
}

/// @nodoc
@JsonSerializable()
class ImageComponent implements ContentComponent {
  const ImageComponent(
      {@UriJsonConverter() required this.imageUri, final String? $type})
      : $type = $type ?? 'image';
  factory ImageComponent.fromJson(Map<String, dynamic> json) =>
      _$ImageComponentFromJson(json);

  @UriJsonConverter()
  final Uri imageUri;

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of ContentComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ImageComponentCopyWith<ImageComponent> get copyWith =>
      _$ImageComponentCopyWithImpl<ImageComponent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ImageComponentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ImageComponent &&
            (identical(other.imageUri, imageUri) ||
                other.imageUri == imageUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUri);

  @override
  String toString() {
    return 'ContentComponent.image(imageUri: $imageUri)';
  }
}

/// @nodoc
abstract mixin class $ImageComponentCopyWith<$Res>
    implements $ContentComponentCopyWith<$Res> {
  factory $ImageComponentCopyWith(
          ImageComponent value, $Res Function(ImageComponent) _then) =
      _$ImageComponentCopyWithImpl;
  @useResult
  $Res call({@UriJsonConverter() Uri imageUri});
}

/// @nodoc
class _$ImageComponentCopyWithImpl<$Res>
    implements $ImageComponentCopyWith<$Res> {
  _$ImageComponentCopyWithImpl(this._self, this._then);

  final ImageComponent _self;
  final $Res Function(ImageComponent) _then;

  /// Create a copy of ContentComponent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? imageUri = null,
  }) {
    return _then(ImageComponent(
      imageUri: null == imageUri
          ? _self.imageUri
          : imageUri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class TextComponent implements ContentComponent {
  const TextComponent({required final Localizations text, final String? $type})
      : _text = text,
        $type = $type ?? 'text';
  factory TextComponent.fromJson(Map<String, dynamic> json) =>
      _$TextComponentFromJson(json);

  final Localizations _text;
  Localizations get text {
    if (_text is EqualUnmodifiableMapView) return _text;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_text);
  }

  @JsonKey(name: 'type')
  final String $type;

  /// Create a copy of ContentComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TextComponentCopyWith<TextComponent> get copyWith =>
      _$TextComponentCopyWithImpl<TextComponent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TextComponentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextComponent &&
            const DeepCollectionEquality().equals(other._text, _text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_text));

  @override
  String toString() {
    return 'ContentComponent.text(text: $text)';
  }
}

/// @nodoc
abstract mixin class $TextComponentCopyWith<$Res>
    implements $ContentComponentCopyWith<$Res> {
  factory $TextComponentCopyWith(
          TextComponent value, $Res Function(TextComponent) _then) =
      _$TextComponentCopyWithImpl;
  @useResult
  $Res call({Localizations text});
}

/// @nodoc
class _$TextComponentCopyWithImpl<$Res>
    implements $TextComponentCopyWith<$Res> {
  _$TextComponentCopyWithImpl(this._self, this._then);

  final TextComponent _self;
  final $Res Function(TextComponent) _then;

  /// Create a copy of ContentComponent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
  }) {
    return _then(TextComponent(
      text: null == text
          ? _self._text
          : text // ignore: cast_nullable_to_non_nullable
              as Localizations,
    ));
  }
}

// dart format on
