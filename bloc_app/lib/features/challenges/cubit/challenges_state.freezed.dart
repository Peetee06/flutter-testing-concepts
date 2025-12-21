// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

/// Adds pattern-matching-related methods to [ChallengesState].
extension ChallengesStatePatterns on ChallengesState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChallengesInitial value)? initial,
    TResult Function(ChallengesLoading value)? loading,
    TResult Function(ChallengesLoaded value)? loaded,
    TResult Function(ChallengesError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ChallengesInitial() when initial != null:
        return initial(_that);
      case ChallengesLoading() when loading != null:
        return loading(_that);
      case ChallengesLoaded() when loaded != null:
        return loaded(_that);
      case ChallengesError() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChallengesInitial value) initial,
    required TResult Function(ChallengesLoading value) loading,
    required TResult Function(ChallengesLoaded value) loaded,
    required TResult Function(ChallengesError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case ChallengesInitial():
        return initial(_that);
      case ChallengesLoading():
        return loading(_that);
      case ChallengesLoaded():
        return loaded(_that);
      case ChallengesError():
        return error(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChallengesInitial value)? initial,
    TResult? Function(ChallengesLoading value)? loading,
    TResult? Function(ChallengesLoaded value)? loaded,
    TResult? Function(ChallengesError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ChallengesInitial() when initial != null:
        return initial(_that);
      case ChallengesLoading() when loading != null:
        return loading(_that);
      case ChallengesLoaded() when loaded != null:
        return loaded(_that);
      case ChallengesError() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Challenge> challenges)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ChallengesInitial() when initial != null:
        return initial();
      case ChallengesLoading() when loading != null:
        return loading();
      case ChallengesLoaded() when loaded != null:
        return loaded(_that.challenges);
      case ChallengesError() when error != null:
        return error(_that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Challenge> challenges) loaded,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case ChallengesInitial():
        return initial();
      case ChallengesLoading():
        return loading();
      case ChallengesLoaded():
        return loaded(_that.challenges);
      case ChallengesError():
        return error(_that.message);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Challenge> challenges)? loaded,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ChallengesInitial() when initial != null:
        return initial();
      case ChallengesLoading() when loading != null:
        return loading();
      case ChallengesLoaded() when loaded != null:
        return loaded(_that.challenges);
      case ChallengesError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
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
