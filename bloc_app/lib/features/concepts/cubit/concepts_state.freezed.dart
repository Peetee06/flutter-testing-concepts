// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'concepts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConceptsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ConceptsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConceptsState()';
  }
}

/// @nodoc
class $ConceptsStateCopyWith<$Res> {
  $ConceptsStateCopyWith(ConceptsState _, $Res Function(ConceptsState) __);
}

/// Adds pattern-matching-related methods to [ConceptsState].
extension ConceptsStatePatterns on ConceptsState {
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
    TResult Function(ConceptsInitial value)? initial,
    TResult Function(ConceptsLoading value)? loading,
    TResult Function(ConceptsLoaded value)? loaded,
    TResult Function(ConceptsError value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ConceptsInitial() when initial != null:
        return initial(_that);
      case ConceptsLoading() when loading != null:
        return loading(_that);
      case ConceptsLoaded() when loaded != null:
        return loaded(_that);
      case ConceptsError() when error != null:
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
    required TResult Function(ConceptsInitial value) initial,
    required TResult Function(ConceptsLoading value) loading,
    required TResult Function(ConceptsLoaded value) loaded,
    required TResult Function(ConceptsError value) error,
  }) {
    final _that = this;
    switch (_that) {
      case ConceptsInitial():
        return initial(_that);
      case ConceptsLoading():
        return loading(_that);
      case ConceptsLoaded():
        return loaded(_that);
      case ConceptsError():
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
    TResult? Function(ConceptsInitial value)? initial,
    TResult? Function(ConceptsLoading value)? loading,
    TResult? Function(ConceptsLoaded value)? loaded,
    TResult? Function(ConceptsError value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ConceptsInitial() when initial != null:
        return initial(_that);
      case ConceptsLoading() when loading != null:
        return loading(_that);
      case ConceptsLoaded() when loaded != null:
        return loaded(_that);
      case ConceptsError() when error != null:
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
    TResult Function(List<Concept> concepts)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ConceptsInitial() when initial != null:
        return initial();
      case ConceptsLoading() when loading != null:
        return loading();
      case ConceptsLoaded() when loaded != null:
        return loaded(_that.concepts);
      case ConceptsError() when error != null:
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
    required TResult Function(List<Concept> concepts) loaded,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case ConceptsInitial():
        return initial();
      case ConceptsLoading():
        return loading();
      case ConceptsLoaded():
        return loaded(_that.concepts);
      case ConceptsError():
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
    TResult? Function(List<Concept> concepts)? loaded,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case ConceptsInitial() when initial != null:
        return initial();
      case ConceptsLoading() when loading != null:
        return loading();
      case ConceptsLoaded() when loaded != null:
        return loaded(_that.concepts);
      case ConceptsError() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ConceptsInitial implements ConceptsState {
  const ConceptsInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ConceptsInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConceptsState.initial()';
  }
}

/// @nodoc

class ConceptsLoading implements ConceptsState {
  const ConceptsLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ConceptsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ConceptsState.loading()';
  }
}

/// @nodoc

class ConceptsLoaded implements ConceptsState {
  const ConceptsLoaded(final List<Concept> concepts) : _concepts = concepts;

  final List<Concept> _concepts;
  List<Concept> get concepts {
    if (_concepts is EqualUnmodifiableListView) return _concepts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_concepts);
  }

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConceptsLoadedCopyWith<ConceptsLoaded> get copyWith =>
      _$ConceptsLoadedCopyWithImpl<ConceptsLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConceptsLoaded &&
            const DeepCollectionEquality().equals(other._concepts, _concepts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_concepts));

  @override
  String toString() {
    return 'ConceptsState.loaded(concepts: $concepts)';
  }
}

/// @nodoc
abstract mixin class $ConceptsLoadedCopyWith<$Res>
    implements $ConceptsStateCopyWith<$Res> {
  factory $ConceptsLoadedCopyWith(
          ConceptsLoaded value, $Res Function(ConceptsLoaded) _then) =
      _$ConceptsLoadedCopyWithImpl;
  @useResult
  $Res call({List<Concept> concepts});
}

/// @nodoc
class _$ConceptsLoadedCopyWithImpl<$Res>
    implements $ConceptsLoadedCopyWith<$Res> {
  _$ConceptsLoadedCopyWithImpl(this._self, this._then);

  final ConceptsLoaded _self;
  final $Res Function(ConceptsLoaded) _then;

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? concepts = null,
  }) {
    return _then(ConceptsLoaded(
      null == concepts
          ? _self._concepts
          : concepts // ignore: cast_nullable_to_non_nullable
              as List<Concept>,
    ));
  }
}

/// @nodoc

class ConceptsError implements ConceptsState {
  const ConceptsError(this.message);

  final String message;

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConceptsErrorCopyWith<ConceptsError> get copyWith =>
      _$ConceptsErrorCopyWithImpl<ConceptsError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ConceptsError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ConceptsState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ConceptsErrorCopyWith<$Res>
    implements $ConceptsStateCopyWith<$Res> {
  factory $ConceptsErrorCopyWith(
          ConceptsError value, $Res Function(ConceptsError) _then) =
      _$ConceptsErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ConceptsErrorCopyWithImpl<$Res>
    implements $ConceptsErrorCopyWith<$Res> {
  _$ConceptsErrorCopyWithImpl(this._self, this._then);

  final ConceptsError _self;
  final $Res Function(ConceptsError) _then;

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ConceptsError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
