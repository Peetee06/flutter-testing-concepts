// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'concept.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Concept {
  String get id;
  Localizations get title;
  List<Section> get sections;
  List<String> get challengeIds;

  /// Create a copy of Concept
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConceptCopyWith<Concept> get copyWith =>
      _$ConceptCopyWithImpl<Concept>(this as Concept, _$identity);

  /// Serializes this Concept to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Concept &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.sections, sections) &&
            const DeepCollectionEquality()
                .equals(other.challengeIds, challengeIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(sections),
      const DeepCollectionEquality().hash(challengeIds));

  @override
  String toString() {
    return 'Concept(id: $id, title: $title, sections: $sections, challengeIds: $challengeIds)';
  }
}

/// @nodoc
abstract mixin class $ConceptCopyWith<$Res> {
  factory $ConceptCopyWith(Concept value, $Res Function(Concept) _then) =
      _$ConceptCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      Localizations title,
      List<Section> sections,
      List<String> challengeIds});
}

/// @nodoc
class _$ConceptCopyWithImpl<$Res> implements $ConceptCopyWith<$Res> {
  _$ConceptCopyWithImpl(this._self, this._then);

  final Concept _self;
  final $Res Function(Concept) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as Localizations,
      sections: null == sections
          ? _self.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<Section>,
      challengeIds: null == challengeIds
          ? _self.challengeIds
          : challengeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Concept implements Concept {
  const _Concept(
      {required this.id,
      required final Localizations title,
      required final List<Section> sections,
      required final List<String> challengeIds})
      : _title = title,
        _sections = sections,
        _challengeIds = challengeIds;
  factory _Concept.fromJson(Map<String, dynamic> json) =>
      _$ConceptFromJson(json);

  @override
  final String id;
  final Localizations _title;
  @override
  Localizations get title {
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

  /// Create a copy of Concept
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConceptCopyWith<_Concept> get copyWith =>
      __$ConceptCopyWithImpl<_Concept>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConceptToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Concept &&
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

  @override
  String toString() {
    return 'Concept(id: $id, title: $title, sections: $sections, challengeIds: $challengeIds)';
  }
}

/// @nodoc
abstract mixin class _$ConceptCopyWith<$Res> implements $ConceptCopyWith<$Res> {
  factory _$ConceptCopyWith(_Concept value, $Res Function(_Concept) _then) =
      __$ConceptCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      Localizations title,
      List<Section> sections,
      List<String> challengeIds});
}

/// @nodoc
class __$ConceptCopyWithImpl<$Res> implements _$ConceptCopyWith<$Res> {
  __$ConceptCopyWithImpl(this._self, this._then);

  final _Concept _self;
  final $Res Function(_Concept) _then;

  /// Create a copy of Concept
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? sections = null,
    Object? challengeIds = null,
  }) {
    return _then(_Concept(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self._title
          : title // ignore: cast_nullable_to_non_nullable
              as Localizations,
      sections: null == sections
          ? _self._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<Section>,
      challengeIds: null == challengeIds
          ? _self._challengeIds
          : challengeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
