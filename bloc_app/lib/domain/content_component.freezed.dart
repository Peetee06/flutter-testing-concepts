// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_component.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@UriJsonConverter() Uri imageUri) image,
    required TResult Function(Map<String, String> text) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@UriJsonConverter() Uri imageUri)? image,
    TResult? Function(Map<String, String> text)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@UriJsonConverter() Uri imageUri)? image,
    TResult Function(Map<String, String> text)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageComponent value) image,
    required TResult Function(TextComponent value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageComponent value)? image,
    TResult? Function(TextComponent value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageComponent value)? image,
    TResult Function(TextComponent value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ContentComponent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentComponentCopyWith<$Res> {
  factory $ContentComponentCopyWith(
          ContentComponent value, $Res Function(ContentComponent) then) =
      _$ContentComponentCopyWithImpl<$Res, ContentComponent>;
}

/// @nodoc
class _$ContentComponentCopyWithImpl<$Res, $Val extends ContentComponent>
    implements $ContentComponentCopyWith<$Res> {
  _$ContentComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentComponent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ImageComponentImplCopyWith<$Res> {
  factory _$$ImageComponentImplCopyWith(_$ImageComponentImpl value,
          $Res Function(_$ImageComponentImpl) then) =
      __$$ImageComponentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({@UriJsonConverter() Uri imageUri});
}

/// @nodoc
class __$$ImageComponentImplCopyWithImpl<$Res>
    extends _$ContentComponentCopyWithImpl<$Res, _$ImageComponentImpl>
    implements _$$ImageComponentImplCopyWith<$Res> {
  __$$ImageComponentImplCopyWithImpl(
      _$ImageComponentImpl _value, $Res Function(_$ImageComponentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentComponent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUri = null,
  }) {
    return _then(_$ImageComponentImpl(
      imageUri: null == imageUri
          ? _value.imageUri
          : imageUri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageComponentImpl implements ImageComponent {
  const _$ImageComponentImpl(
      {@UriJsonConverter() required this.imageUri, final String? $type})
      : $type = $type ?? 'image';

  factory _$ImageComponentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageComponentImplFromJson(json);

  @override
  @UriJsonConverter()
  final Uri imageUri;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ContentComponent.image(imageUri: $imageUri)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageComponentImpl &&
            (identical(other.imageUri, imageUri) ||
                other.imageUri == imageUri));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imageUri);

  /// Create a copy of ContentComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageComponentImplCopyWith<_$ImageComponentImpl> get copyWith =>
      __$$ImageComponentImplCopyWithImpl<_$ImageComponentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@UriJsonConverter() Uri imageUri) image,
    required TResult Function(Map<String, String> text) text,
  }) {
    return image(imageUri);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@UriJsonConverter() Uri imageUri)? image,
    TResult? Function(Map<String, String> text)? text,
  }) {
    return image?.call(imageUri);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@UriJsonConverter() Uri imageUri)? image,
    TResult Function(Map<String, String> text)? text,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(imageUri);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageComponent value) image,
    required TResult Function(TextComponent value) text,
  }) {
    return image(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageComponent value)? image,
    TResult? Function(TextComponent value)? text,
  }) {
    return image?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageComponent value)? image,
    TResult Function(TextComponent value)? text,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageComponentImplToJson(
      this,
    );
  }
}

abstract class ImageComponent implements ContentComponent {
  const factory ImageComponent(
      {@UriJsonConverter() required final Uri imageUri}) = _$ImageComponentImpl;

  factory ImageComponent.fromJson(Map<String, dynamic> json) =
      _$ImageComponentImpl.fromJson;

  @UriJsonConverter()
  Uri get imageUri;

  /// Create a copy of ContentComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageComponentImplCopyWith<_$ImageComponentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TextComponentImplCopyWith<$Res> {
  factory _$$TextComponentImplCopyWith(
          _$TextComponentImpl value, $Res Function(_$TextComponentImpl) then) =
      __$$TextComponentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, String> text});
}

/// @nodoc
class __$$TextComponentImplCopyWithImpl<$Res>
    extends _$ContentComponentCopyWithImpl<$Res, _$TextComponentImpl>
    implements _$$TextComponentImplCopyWith<$Res> {
  __$$TextComponentImplCopyWithImpl(
      _$TextComponentImpl _value, $Res Function(_$TextComponentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentComponent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$TextComponentImpl(
      text: null == text
          ? _value._text
          : text // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextComponentImpl implements TextComponent {
  const _$TextComponentImpl(
      {required final Map<String, String> text, final String? $type})
      : _text = text,
        $type = $type ?? 'text';

  factory _$TextComponentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextComponentImplFromJson(json);

  final Map<String, String> _text;
  @override
  Map<String, String> get text {
    if (_text is EqualUnmodifiableMapView) return _text;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_text);
  }

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ContentComponent.text(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextComponentImpl &&
            const DeepCollectionEquality().equals(other._text, _text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_text));

  /// Create a copy of ContentComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextComponentImplCopyWith<_$TextComponentImpl> get copyWith =>
      __$$TextComponentImplCopyWithImpl<_$TextComponentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(@UriJsonConverter() Uri imageUri) image,
    required TResult Function(Map<String, String> text) text,
  }) {
    return text(this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(@UriJsonConverter() Uri imageUri)? image,
    TResult? Function(Map<String, String> text)? text,
  }) {
    return text?.call(this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(@UriJsonConverter() Uri imageUri)? image,
    TResult Function(Map<String, String> text)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageComponent value) image,
    required TResult Function(TextComponent value) text,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageComponent value)? image,
    TResult? Function(TextComponent value)? text,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageComponent value)? image,
    TResult Function(TextComponent value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextComponentImplToJson(
      this,
    );
  }
}

abstract class TextComponent implements ContentComponent {
  const factory TextComponent({required final Map<String, String> text}) =
      _$TextComponentImpl;

  factory TextComponent.fromJson(Map<String, dynamic> json) =
      _$TextComponentImpl.fromJson;

  Map<String, String> get text;

  /// Create a copy of ContentComponent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextComponentImplCopyWith<_$TextComponentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
