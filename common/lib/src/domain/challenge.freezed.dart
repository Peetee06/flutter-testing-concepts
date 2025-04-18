// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Challenge {
  String get id;
  Localizations get question;
  List<Answer> get options;
  List<String> get correctAnswerIds;

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChallengeCopyWith<Challenge> get copyWith =>
      _$ChallengeCopyWithImpl<Challenge>(this as Challenge, _$identity);

  /// Serializes this Challenge to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Challenge &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.options, options) &&
            const DeepCollectionEquality()
                .equals(other.correctAnswerIds, correctAnswerIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(options),
      const DeepCollectionEquality().hash(correctAnswerIds));

  @override
  String toString() {
    return 'Challenge(id: $id, question: $question, options: $options, correctAnswerIds: $correctAnswerIds)';
  }
}

/// @nodoc
abstract mixin class $ChallengeCopyWith<$Res> {
  factory $ChallengeCopyWith(Challenge value, $Res Function(Challenge) _then) =
      _$ChallengeCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      Localizations question,
      List<Answer> options,
      List<String> correctAnswerIds});
}

/// @nodoc
class _$ChallengeCopyWithImpl<$Res> implements $ChallengeCopyWith<$Res> {
  _$ChallengeCopyWithImpl(this._self, this._then);

  final Challenge _self;
  final $Res Function(Challenge) _then;

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? options = null,
    Object? correctAnswerIds = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _self.question
          : question // ignore: cast_nullable_to_non_nullable
              as Localizations,
      options: null == options
          ? _self.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      correctAnswerIds: null == correctAnswerIds
          ? _self.correctAnswerIds
          : correctAnswerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Challenge implements Challenge {
  _Challenge(
      {required this.id,
      required final Localizations question,
      required final List<Answer> options,
      required final List<String> correctAnswerIds})
      : assert(options.map((o) => o.id).toSet().containsAll(correctAnswerIds),
            'Each correctAnswerId must match an id in options'),
        _question = question,
        _options = options,
        _correctAnswerIds = correctAnswerIds;
  factory _Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  @override
  final String id;
  final Localizations _question;
  @override
  Localizations get question {
    if (_question is EqualUnmodifiableMapView) return _question;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_question);
  }

  final List<Answer> _options;
  @override
  List<Answer> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  final List<String> _correctAnswerIds;
  @override
  List<String> get correctAnswerIds {
    if (_correctAnswerIds is EqualUnmodifiableListView)
      return _correctAnswerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_correctAnswerIds);
  }

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChallengeCopyWith<_Challenge> get copyWith =>
      __$ChallengeCopyWithImpl<_Challenge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChallengeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Challenge &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._question, _question) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            const DeepCollectionEquality()
                .equals(other._correctAnswerIds, _correctAnswerIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_question),
      const DeepCollectionEquality().hash(_options),
      const DeepCollectionEquality().hash(_correctAnswerIds));

  @override
  String toString() {
    return 'Challenge(id: $id, question: $question, options: $options, correctAnswerIds: $correctAnswerIds)';
  }
}

/// @nodoc
abstract mixin class _$ChallengeCopyWith<$Res>
    implements $ChallengeCopyWith<$Res> {
  factory _$ChallengeCopyWith(
          _Challenge value, $Res Function(_Challenge) _then) =
      __$ChallengeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      Localizations question,
      List<Answer> options,
      List<String> correctAnswerIds});
}

/// @nodoc
class __$ChallengeCopyWithImpl<$Res> implements _$ChallengeCopyWith<$Res> {
  __$ChallengeCopyWithImpl(this._self, this._then);

  final _Challenge _self;
  final $Res Function(_Challenge) _then;

  /// Create a copy of Challenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? options = null,
    Object? correctAnswerIds = null,
  }) {
    return _then(_Challenge(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _self._question
          : question // ignore: cast_nullable_to_non_nullable
              as Localizations,
      options: null == options
          ? _self._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      correctAnswerIds: null == correctAnswerIds
          ? _self._correctAnswerIds
          : correctAnswerIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
