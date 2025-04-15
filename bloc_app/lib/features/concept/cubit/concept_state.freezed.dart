// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'concept_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConceptState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Concept concept) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Concept concept)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Concept concept)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConceptInitial value) initial,
    required TResult Function(ConceptLoading value) loading,
    required TResult Function(ConceptLoaded value) loaded,
    required TResult Function(ConceptError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConceptInitial value)? initial,
    TResult? Function(ConceptLoading value)? loading,
    TResult? Function(ConceptLoaded value)? loaded,
    TResult? Function(ConceptError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConceptInitial value)? initial,
    TResult Function(ConceptLoading value)? loading,
    TResult Function(ConceptLoaded value)? loaded,
    TResult Function(ConceptError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConceptStateCopyWith<$Res> {
  factory $ConceptStateCopyWith(
          ConceptState value, $Res Function(ConceptState) then) =
      _$ConceptStateCopyWithImpl<$Res, ConceptState>;
}

/// @nodoc
class _$ConceptStateCopyWithImpl<$Res, $Val extends ConceptState>
    implements $ConceptStateCopyWith<$Res> {
  _$ConceptStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConceptInitialImplCopyWith<$Res> {
  factory _$$ConceptInitialImplCopyWith(_$ConceptInitialImpl value,
          $Res Function(_$ConceptInitialImpl) then) =
      __$$ConceptInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConceptInitialImplCopyWithImpl<$Res>
    extends _$ConceptStateCopyWithImpl<$Res, _$ConceptInitialImpl>
    implements _$$ConceptInitialImplCopyWith<$Res> {
  __$$ConceptInitialImplCopyWithImpl(
      _$ConceptInitialImpl _value, $Res Function(_$ConceptInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConceptInitialImpl implements ConceptInitial {
  const _$ConceptInitialImpl();

  @override
  String toString() {
    return 'ConceptState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConceptInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Concept concept) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Concept concept)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Concept concept)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConceptInitial value) initial,
    required TResult Function(ConceptLoading value) loading,
    required TResult Function(ConceptLoaded value) loaded,
    required TResult Function(ConceptError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConceptInitial value)? initial,
    TResult? Function(ConceptLoading value)? loading,
    TResult? Function(ConceptLoaded value)? loaded,
    TResult? Function(ConceptError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConceptInitial value)? initial,
    TResult Function(ConceptLoading value)? loading,
    TResult Function(ConceptLoaded value)? loaded,
    TResult Function(ConceptError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ConceptInitial implements ConceptState {
  const factory ConceptInitial() = _$ConceptInitialImpl;
}

/// @nodoc
abstract class _$$ConceptLoadingImplCopyWith<$Res> {
  factory _$$ConceptLoadingImplCopyWith(_$ConceptLoadingImpl value,
          $Res Function(_$ConceptLoadingImpl) then) =
      __$$ConceptLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConceptLoadingImplCopyWithImpl<$Res>
    extends _$ConceptStateCopyWithImpl<$Res, _$ConceptLoadingImpl>
    implements _$$ConceptLoadingImplCopyWith<$Res> {
  __$$ConceptLoadingImplCopyWithImpl(
      _$ConceptLoadingImpl _value, $Res Function(_$ConceptLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConceptLoadingImpl implements ConceptLoading {
  const _$ConceptLoadingImpl();

  @override
  String toString() {
    return 'ConceptState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConceptLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Concept concept) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Concept concept)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Concept concept)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConceptInitial value) initial,
    required TResult Function(ConceptLoading value) loading,
    required TResult Function(ConceptLoaded value) loaded,
    required TResult Function(ConceptError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConceptInitial value)? initial,
    TResult? Function(ConceptLoading value)? loading,
    TResult? Function(ConceptLoaded value)? loaded,
    TResult? Function(ConceptError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConceptInitial value)? initial,
    TResult Function(ConceptLoading value)? loading,
    TResult Function(ConceptLoaded value)? loaded,
    TResult Function(ConceptError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ConceptLoading implements ConceptState {
  const factory ConceptLoading() = _$ConceptLoadingImpl;
}

/// @nodoc
abstract class _$$ConceptLoadedImplCopyWith<$Res> {
  factory _$$ConceptLoadedImplCopyWith(
          _$ConceptLoadedImpl value, $Res Function(_$ConceptLoadedImpl) then) =
      __$$ConceptLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Concept concept});

  $ConceptCopyWith<$Res> get concept;
}

/// @nodoc
class __$$ConceptLoadedImplCopyWithImpl<$Res>
    extends _$ConceptStateCopyWithImpl<$Res, _$ConceptLoadedImpl>
    implements _$$ConceptLoadedImplCopyWith<$Res> {
  __$$ConceptLoadedImplCopyWithImpl(
      _$ConceptLoadedImpl _value, $Res Function(_$ConceptLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concept = null,
  }) {
    return _then(_$ConceptLoadedImpl(
      null == concept
          ? _value.concept
          : concept // ignore: cast_nullable_to_non_nullable
              as Concept,
    ));
  }

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConceptCopyWith<$Res> get concept {
    return $ConceptCopyWith<$Res>(_value.concept, (value) {
      return _then(_value.copyWith(concept: value));
    });
  }
}

/// @nodoc

class _$ConceptLoadedImpl implements ConceptLoaded {
  const _$ConceptLoadedImpl(this.concept);

  @override
  final Concept concept;

  @override
  String toString() {
    return 'ConceptState.loaded(concept: $concept)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConceptLoadedImpl &&
            (identical(other.concept, concept) || other.concept == concept));
  }

  @override
  int get hashCode => Object.hash(runtimeType, concept);

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConceptLoadedImplCopyWith<_$ConceptLoadedImpl> get copyWith =>
      __$$ConceptLoadedImplCopyWithImpl<_$ConceptLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Concept concept) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(concept);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Concept concept)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(concept);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Concept concept)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(concept);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConceptInitial value) initial,
    required TResult Function(ConceptLoading value) loading,
    required TResult Function(ConceptLoaded value) loaded,
    required TResult Function(ConceptError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConceptInitial value)? initial,
    TResult? Function(ConceptLoading value)? loading,
    TResult? Function(ConceptLoaded value)? loaded,
    TResult? Function(ConceptError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConceptInitial value)? initial,
    TResult Function(ConceptLoading value)? loading,
    TResult Function(ConceptLoaded value)? loaded,
    TResult Function(ConceptError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ConceptLoaded implements ConceptState {
  const factory ConceptLoaded(final Concept concept) = _$ConceptLoadedImpl;

  Concept get concept;

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConceptLoadedImplCopyWith<_$ConceptLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConceptErrorImplCopyWith<$Res> {
  factory _$$ConceptErrorImplCopyWith(
          _$ConceptErrorImpl value, $Res Function(_$ConceptErrorImpl) then) =
      __$$ConceptErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ConceptErrorImplCopyWithImpl<$Res>
    extends _$ConceptStateCopyWithImpl<$Res, _$ConceptErrorImpl>
    implements _$$ConceptErrorImplCopyWith<$Res> {
  __$$ConceptErrorImplCopyWithImpl(
      _$ConceptErrorImpl _value, $Res Function(_$ConceptErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ConceptErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConceptErrorImpl implements ConceptError {
  const _$ConceptErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ConceptState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConceptErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConceptErrorImplCopyWith<_$ConceptErrorImpl> get copyWith =>
      __$$ConceptErrorImplCopyWithImpl<_$ConceptErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Concept concept) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Concept concept)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Concept concept)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConceptInitial value) initial,
    required TResult Function(ConceptLoading value) loading,
    required TResult Function(ConceptLoaded value) loaded,
    required TResult Function(ConceptError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConceptInitial value)? initial,
    TResult? Function(ConceptLoading value)? loading,
    TResult? Function(ConceptLoaded value)? loaded,
    TResult? Function(ConceptError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConceptInitial value)? initial,
    TResult Function(ConceptLoading value)? loading,
    TResult Function(ConceptLoaded value)? loaded,
    TResult Function(ConceptError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ConceptError implements ConceptState {
  const factory ConceptError(final String message) = _$ConceptErrorImpl;

  String get message;

  /// Create a copy of ConceptState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConceptErrorImplCopyWith<_$ConceptErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
