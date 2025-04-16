// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'concept.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Concept _$ConceptFromJson(Map<String, dynamic> json) {
  return _Concept.fromJson(json);
}

/// @nodoc
mixin _$Concept {
  String get id => throw _privateConstructorUsedError;
  Map<String, String> get title => throw _privateConstructorUsedError;
  List<Section> get sections => throw _privateConstructorUsedError;
  List<String> get challengeIds => throw _privateConstructorUsedError;

  /// Serializes this Concept to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Concept
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConceptCopyWith<Concept> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConceptCopyWith<$Res> {
  factory $ConceptCopyWith(Concept value, $Res Function(Concept) then) =
      _$ConceptCopyWithImpl<$Res, Concept>;
  @useResult
  $Res call(
      {String id,
      Map<String, String> title,
      List<Section> sections,
      List<String> challengeIds});
}

/// @nodoc
class _$ConceptCopyWithImpl<$Res, $Val extends Concept>
    implements $ConceptCopyWith<$Res> {
  _$ConceptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Concept
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? sections = null,
    Object? challengeIds = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<Section>,
      challengeIds: null == challengeIds
          ? _value.challengeIds
          : challengeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConceptImplCopyWith<$Res> implements $ConceptCopyWith<$Res> {
  factory _$$ConceptImplCopyWith(
          _$ConceptImpl value, $Res Function(_$ConceptImpl) then) =
      __$$ConceptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Map<String, String> title,
      List<Section> sections,
      List<String> challengeIds});
}

/// @nodoc
class __$$ConceptImplCopyWithImpl<$Res>
    extends _$ConceptCopyWithImpl<$Res, _$ConceptImpl>
    implements _$$ConceptImplCopyWith<$Res> {
  __$$ConceptImplCopyWithImpl(
      _$ConceptImpl _value, $Res Function(_$ConceptImpl) _then)
      : super(_value, _then);

  /// Create a copy of Concept
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? sections = null,
    Object? challengeIds = null,
  }) {
    return _then(_$ConceptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value._title
          : title // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<Section>,
      challengeIds: null == challengeIds
          ? _value._challengeIds
          : challengeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConceptImpl implements _Concept {
  const _$ConceptImpl(
      {required this.id,
      required final Map<String, String> title,
      required final List<Section> sections,
      required final List<String> challengeIds})
      : _title = title,
        _sections = sections,
        _challengeIds = challengeIds;

  factory _$ConceptImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConceptImplFromJson(json);

  @override
  final String id;
  final Map<String, String> _title;
  @override
  Map<String, String> get title {
    if (_title is EqualUnmodifiableMapView) return _title;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_title);
  }

  final List<Section> _sections;
  @override
  List<Section> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  final List<String> _challengeIds;
  @override
  List<String> get challengeIds {
    if (_challengeIds is EqualUnmodifiableListView) return _challengeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challengeIds);
  }

  @override
  String toString() {
    return 'Concept(id: $id, title: $title, sections: $sections, challengeIds: $challengeIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConceptImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._title, _title) &&
            const DeepCollectionEquality().equals(other._sections, _sections) &&
            const DeepCollectionEquality()
                .equals(other._challengeIds, _challengeIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_title),
      const DeepCollectionEquality().hash(_sections),
      const DeepCollectionEquality().hash(_challengeIds));

  /// Create a copy of Concept
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConceptImplCopyWith<_$ConceptImpl> get copyWith =>
      __$$ConceptImplCopyWithImpl<_$ConceptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConceptImplToJson(
      this,
    );
  }
}

abstract class _Concept implements Concept {
  const factory _Concept(
      {required final String id,
      required final Map<String, String> title,
      required final List<Section> sections,
      required final List<String> challengeIds}) = _$ConceptImpl;

  factory _Concept.fromJson(Map<String, dynamic> json) = _$ConceptImpl.fromJson;

  @override
  String get id;
  @override
  Map<String, String> get title;
  @override
  List<Section> get sections;
  @override
  List<String> get challengeIds;

  /// Create a copy of Concept
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConceptImplCopyWith<_$ConceptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
