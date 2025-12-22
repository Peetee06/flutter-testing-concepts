// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallengeProgress {
  /// IDs of the currently selected answers.
  Set<String> get selectedAnswerIds;

  /// Whether the challenge has been submitted.
  bool get isSubmitted;

  /// Create a copy of ChallengeProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChallengeProgressCopyWith<ChallengeProgress> get copyWith =>
      _$ChallengeProgressCopyWithImpl<ChallengeProgress>(
          this as ChallengeProgress, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChallengeProgress &&
            const DeepCollectionEquality()
                .equals(other.selectedAnswerIds, selectedAnswerIds) &&
            (identical(other.isSubmitted, isSubmitted) ||
                other.isSubmitted == isSubmitted));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(selectedAnswerIds), isSubmitted);

  @override
  String toString() {
    return 'ChallengeProgress(selectedAnswerIds: $selectedAnswerIds, isSubmitted: $isSubmitted)';
  }
}

/// @nodoc
abstract mixin class $ChallengeProgressCopyWith<$Res> {
  factory $ChallengeProgressCopyWith(
          ChallengeProgress value, $Res Function(ChallengeProgress) _then) =
      _$ChallengeProgressCopyWithImpl;
  @useResult
  $Res call({Set<String> selectedAnswerIds, bool isSubmitted});
}

/// @nodoc
class _$ChallengeProgressCopyWithImpl<$Res>
    implements $ChallengeProgressCopyWith<$Res> {
  _$ChallengeProgressCopyWithImpl(this._self, this._then);

  final ChallengeProgress _self;
  final $Res Function(ChallengeProgress) _then;

  /// Create a copy of ChallengeProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAnswerIds = null,
    Object? isSubmitted = null,
  }) {
    return _then(_self.copyWith(
      selectedAnswerIds: null == selectedAnswerIds
          ? _self.selectedAnswerIds
          : selectedAnswerIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      isSubmitted: null == isSubmitted
          ? _self.isSubmitted
          : isSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChallengeProgress].
extension ChallengeProgressPatterns on ChallengeProgress {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ChallengeProgress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChallengeProgress() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_ChallengeProgress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChallengeProgress():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ChallengeProgress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChallengeProgress() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(Set<String> selectedAnswerIds, bool isSubmitted)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChallengeProgress() when $default != null:
        return $default(_that.selectedAnswerIds, _that.isSubmitted);
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
  TResult when<TResult extends Object?>(
    TResult Function(Set<String> selectedAnswerIds, bool isSubmitted) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChallengeProgress():
        return $default(_that.selectedAnswerIds, _that.isSubmitted);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(Set<String> selectedAnswerIds, bool isSubmitted)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChallengeProgress() when $default != null:
        return $default(_that.selectedAnswerIds, _that.isSubmitted);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChallengeProgress implements ChallengeProgress {
  const _ChallengeProgress(
      {final Set<String> selectedAnswerIds = const <String>{},
      this.isSubmitted = false})
      : _selectedAnswerIds = selectedAnswerIds;

  /// IDs of the currently selected answers.
  final Set<String> _selectedAnswerIds;

  /// IDs of the currently selected answers.
  @override
  @JsonKey()
  Set<String> get selectedAnswerIds {
    if (_selectedAnswerIds is EqualUnmodifiableSetView)
      return _selectedAnswerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedAnswerIds);
  }

  /// Whether the challenge has been submitted.
  @override
  @JsonKey()
  final bool isSubmitted;

  /// Create a copy of ChallengeProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChallengeProgressCopyWith<_ChallengeProgress> get copyWith =>
      __$ChallengeProgressCopyWithImpl<_ChallengeProgress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChallengeProgress &&
            const DeepCollectionEquality()
                .equals(other._selectedAnswerIds, _selectedAnswerIds) &&
            (identical(other.isSubmitted, isSubmitted) ||
                other.isSubmitted == isSubmitted));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_selectedAnswerIds), isSubmitted);

  @override
  String toString() {
    return 'ChallengeProgress(selectedAnswerIds: $selectedAnswerIds, isSubmitted: $isSubmitted)';
  }
}

/// @nodoc
abstract mixin class _$ChallengeProgressCopyWith<$Res>
    implements $ChallengeProgressCopyWith<$Res> {
  factory _$ChallengeProgressCopyWith(
          _ChallengeProgress value, $Res Function(_ChallengeProgress) _then) =
      __$ChallengeProgressCopyWithImpl;
  @override
  @useResult
  $Res call({Set<String> selectedAnswerIds, bool isSubmitted});
}

/// @nodoc
class __$ChallengeProgressCopyWithImpl<$Res>
    implements _$ChallengeProgressCopyWith<$Res> {
  __$ChallengeProgressCopyWithImpl(this._self, this._then);

  final _ChallengeProgress _self;
  final $Res Function(_ChallengeProgress) _then;

  /// Create a copy of ChallengeProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedAnswerIds = null,
    Object? isSubmitted = null,
  }) {
    return _then(_ChallengeProgress(
      selectedAnswerIds: null == selectedAnswerIds
          ? _self._selectedAnswerIds
          : selectedAnswerIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      isSubmitted: null == isSubmitted
          ? _self.isSubmitted
          : isSubmitted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
