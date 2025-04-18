// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenges_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallengesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChallengesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChallengesState()';
  }
}

/// @nodoc
class $ChallengesStateCopyWith<$Res> {
  $ChallengesStateCopyWith(
      ChallengesState _, $Res Function(ChallengesState) __);
}

/// @nodoc

class ChallengesInitial implements ChallengesState {
  const ChallengesInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChallengesInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChallengesState.initial()';
  }
}

/// @nodoc

class ChallengesLoading implements ChallengesState {
  const ChallengesLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChallengesLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChallengesState.loading()';
  }
}

/// @nodoc

class ChallengesLoaded implements ChallengesState {
  const ChallengesLoaded(final List<Challenge> challenges)
      : _challenges = challenges;

  final List<Challenge> _challenges;
  List<Challenge> get challenges {
    if (_challenges is EqualUnmodifiableListView) return _challenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challenges);
  }

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChallengesLoadedCopyWith<ChallengesLoaded> get copyWith =>
      _$ChallengesLoadedCopyWithImpl<ChallengesLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChallengesLoaded &&
            const DeepCollectionEquality()
                .equals(other._challenges, _challenges));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_challenges));

  @override
  String toString() {
    return 'ChallengesState.loaded(challenges: $challenges)';
  }
}

/// @nodoc
abstract mixin class $ChallengesLoadedCopyWith<$Res>
    implements $ChallengesStateCopyWith<$Res> {
  factory $ChallengesLoadedCopyWith(
          ChallengesLoaded value, $Res Function(ChallengesLoaded) _then) =
      _$ChallengesLoadedCopyWithImpl;
  @useResult
  $Res call({List<Challenge> challenges});
}

/// @nodoc
class _$ChallengesLoadedCopyWithImpl<$Res>
    implements $ChallengesLoadedCopyWith<$Res> {
  _$ChallengesLoadedCopyWithImpl(this._self, this._then);

  final ChallengesLoaded _self;
  final $Res Function(ChallengesLoaded) _then;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? challenges = null,
  }) {
    return _then(ChallengesLoaded(
      null == challenges
          ? _self._challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>,
    ));
  }
}

/// @nodoc

class ChallengesError implements ChallengesState {
  const ChallengesError(this.message);

  final String message;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChallengesErrorCopyWith<ChallengesError> get copyWith =>
      _$ChallengesErrorCopyWithImpl<ChallengesError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChallengesError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ChallengesState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ChallengesErrorCopyWith<$Res>
    implements $ChallengesStateCopyWith<$Res> {
  factory $ChallengesErrorCopyWith(
          ChallengesError value, $Res Function(ChallengesError) _then) =
      _$ChallengesErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ChallengesErrorCopyWithImpl<$Res>
    implements $ChallengesErrorCopyWith<$Res> {
  _$ChallengesErrorCopyWithImpl(this._self, this._then);

  final ChallengesError _self;
  final $Res Function(ChallengesError) _then;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ChallengesError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
