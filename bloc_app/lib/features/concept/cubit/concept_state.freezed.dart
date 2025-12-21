// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'concept_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConceptState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ConceptState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConceptState()';
  }
}

/// @nodoc
class $ConceptStateCopyWith<$Res> {
  $ConceptStateCopyWith(ConceptState _, $Res Function(ConceptState) __);
}

/// Adds pattern-matching-related methods to [ConceptState].
extension ConceptStatePatterns on ConceptState {
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
    TResult Function(ConceptInitial value)? initial,
    TResult Function(ConceptLoading value)? loading,
    TResult Function(ConceptLoaded value)? loaded,
    TResult Function(ConceptError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ConceptInitial() when initial != null:
        return initial(_that);
      case ConceptLoading() when loading != null:
        return loading(_that);
      case ConceptLoaded() when loaded != null:
        return loaded(_that);
      case ConceptError() when error != null:
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
    required TResult Function(ConceptInitial value) initial,
    required TResult Function(ConceptLoading value) loading,
    required TResult Function(ConceptLoaded value) loaded,
    required TResult Function(ConceptError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case ConceptInitial():
        return initial(_that);
      case ConceptLoading():
        return loading(_that);
      case ConceptLoaded():
        return loaded(_that);
      case ConceptError():
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
    TResult? Function(ConceptInitial value)? initial,
    TResult? Function(ConceptLoading value)? loading,
    TResult? Function(ConceptLoaded value)? loaded,
    TResult? Function(ConceptError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ConceptInitial() when initial != null:
        return initial(_that);
      case ConceptLoading() when loading != null:
        return loading(_that);
      case ConceptLoaded() when loaded != null:
        return loaded(_that);
      case ConceptError() when error != null:
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
    TResult Function(Concept concept)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ConceptInitial() when initial != null:
        return initial();
      case ConceptLoading() when loading != null:
        return loading();
      case ConceptLoaded() when loaded != null:
        return loaded(_that.concept);
      case ConceptError() when error != null:
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
    required TResult Function(Concept concept) loaded,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case ConceptInitial():
        return initial();
      case ConceptLoading():
        return loading();
      case ConceptLoaded():
        return loaded(_that.concept);
      case ConceptError():
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
    TResult? Function(Concept concept)? loaded,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ConceptInitial() when initial != null:
        return initial();
      case ConceptLoading() when loading != null:
        return loading();
      case ConceptLoaded() when loaded != null:
        return loaded(_that.concept);
      case ConceptError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ConceptInitial implements ConceptState {
  const ConceptInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ConceptInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConceptState.initial()';
  }
}

/// @nodoc

class ConceptLoading implements ConceptState {
  const ConceptLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ConceptLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConceptState.loading()';
  }
}

/// @nodoc

class ConceptLoaded implements ConceptState {
  const ConceptLoaded(this.concept);

  final Concept concept;

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConceptLoadedCopyWith<ConceptLoaded> get copyWith =>
      _$ConceptLoadedCopyWithImpl<ConceptLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConceptLoaded &&
            (identical(other.concept, concept) || other.concept == concept));
  }

  @override
  int get hashCode => Object.hash(runtimeType, concept);

  @override
  String toString() {
    return 'ConceptState.loaded(concept: $concept)';
  }
}

/// @nodoc
abstract mixin class $ConceptLoadedCopyWith<$Res>
    implements $ConceptStateCopyWith<$Res> {
  factory $ConceptLoadedCopyWith(
          ConceptLoaded value, $Res Function(ConceptLoaded) _then) =
      _$ConceptLoadedCopyWithImpl;
  @useResult
  $Res call({Concept concept});

  $ConceptCopyWith<$Res> get concept;
}

/// @nodoc
class _$ConceptLoadedCopyWithImpl<$Res>
    implements $ConceptLoadedCopyWith<$Res> {
  _$ConceptLoadedCopyWithImpl(this._self, this._then);

  final ConceptLoaded _self;
  final $Res Function(ConceptLoaded) _then;

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? concept = null,
  }) {
    return _then(ConceptLoaded(
      null == concept
          ? _self.concept
          : concept // ignore: cast_nullable_to_non_nullable
              as Concept,
    ));
  }

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConceptCopyWith<$Res> get concept {
    return $ConceptCopyWith<$Res>(_self.concept, (value) {
      return _then(_self.copyWith(concept: value));
    });
  }
}

/// @nodoc

class ConceptError implements ConceptState {
  const ConceptError(this.message);

  final String message;

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConceptErrorCopyWith<ConceptError> get copyWith =>
      _$ConceptErrorCopyWithImpl<ConceptError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConceptError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ConceptState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ConceptErrorCopyWith<$Res>
    implements $ConceptStateCopyWith<$Res> {
  factory $ConceptErrorCopyWith(
          ConceptError value, $Res Function(ConceptError) _then) =
      _$ConceptErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ConceptErrorCopyWithImpl<$Res> implements $ConceptErrorCopyWith<$Res> {
  _$ConceptErrorCopyWithImpl(this._self, this._then);

  final ConceptError _self;
  final $Res Function(ConceptError) _then;

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ConceptError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
