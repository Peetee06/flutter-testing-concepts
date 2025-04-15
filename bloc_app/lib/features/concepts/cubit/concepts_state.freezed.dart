// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'concepts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConceptsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Concept> concepts) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Concept> concepts)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Concept> concepts)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConceptsInitial value) initial,
    required TResult Function(ConceptsLoading value) loading,
    required TResult Function(ConceptsLoaded value) loaded,
    required TResult Function(ConceptsError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConceptsInitial value)? initial,
    TResult? Function(ConceptsLoading value)? loading,
    TResult? Function(ConceptsLoaded value)? loaded,
    TResult? Function(ConceptsError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConceptsInitial value)? initial,
    TResult Function(ConceptsLoading value)? loading,
    TResult Function(ConceptsLoaded value)? loaded,
    TResult Function(ConceptsError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConceptsStateCopyWith<$Res> {
  factory $ConceptsStateCopyWith(
          ConceptsState value, $Res Function(ConceptsState) then) =
      _$ConceptsStateCopyWithImpl<$Res, ConceptsState>;
}

/// @nodoc
class _$ConceptsStateCopyWithImpl<$Res, $Val extends ConceptsState>
    implements $ConceptsStateCopyWith<$Res> {
  _$ConceptsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConceptsInitialImplCopyWith<$Res> {
  factory _$$ConceptsInitialImplCopyWith(_$ConceptsInitialImpl value,
          $Res Function(_$ConceptsInitialImpl) then) =
      __$$ConceptsInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConceptsInitialImplCopyWithImpl<$Res>
    extends _$ConceptsStateCopyWithImpl<$Res, _$ConceptsInitialImpl>
    implements _$$ConceptsInitialImplCopyWith<$Res> {
  __$$ConceptsInitialImplCopyWithImpl(
      _$ConceptsInitialImpl _value, $Res Function(_$ConceptsInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConceptsInitialImpl implements ConceptsInitial {
  const _$ConceptsInitialImpl();

  @override
  String toString() {
    return 'ConceptsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConceptsInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Concept> concepts) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Concept> concepts)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Concept> concepts)? loaded,
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
    required TResult Function(ConceptsInitial value) initial,
    required TResult Function(ConceptsLoading value) loading,
    required TResult Function(ConceptsLoaded value) loaded,
    required TResult Function(ConceptsError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConceptsInitial value)? initial,
    TResult? Function(ConceptsLoading value)? loading,
    TResult? Function(ConceptsLoaded value)? loaded,
    TResult? Function(ConceptsError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConceptsInitial value)? initial,
    TResult Function(ConceptsLoading value)? loading,
    TResult Function(ConceptsLoaded value)? loaded,
    TResult Function(ConceptsError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ConceptsInitial implements ConceptsState {
  const factory ConceptsInitial() = _$ConceptsInitialImpl;
}

/// @nodoc
abstract class _$$ConceptsLoadingImplCopyWith<$Res> {
  factory _$$ConceptsLoadingImplCopyWith(_$ConceptsLoadingImpl value,
          $Res Function(_$ConceptsLoadingImpl) then) =
      __$$ConceptsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConceptsLoadingImplCopyWithImpl<$Res>
    extends _$ConceptsStateCopyWithImpl<$Res, _$ConceptsLoadingImpl>
    implements _$$ConceptsLoadingImplCopyWith<$Res> {
  __$$ConceptsLoadingImplCopyWithImpl(
      _$ConceptsLoadingImpl _value, $Res Function(_$ConceptsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConceptsLoadingImpl implements ConceptsLoading {
  const _$ConceptsLoadingImpl();

  @override
  String toString() {
    return 'ConceptsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConceptsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Concept> concepts) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Concept> concepts)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Concept> concepts)? loaded,
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
    required TResult Function(ConceptsInitial value) initial,
    required TResult Function(ConceptsLoading value) loading,
    required TResult Function(ConceptsLoaded value) loaded,
    required TResult Function(ConceptsError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConceptsInitial value)? initial,
    TResult? Function(ConceptsLoading value)? loading,
    TResult? Function(ConceptsLoaded value)? loaded,
    TResult? Function(ConceptsError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConceptsInitial value)? initial,
    TResult Function(ConceptsLoading value)? loading,
    TResult Function(ConceptsLoaded value)? loaded,
    TResult Function(ConceptsError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ConceptsLoading implements ConceptsState {
  const factory ConceptsLoading() = _$ConceptsLoadingImpl;
}

/// @nodoc
abstract class _$$ConceptsLoadedImplCopyWith<$Res> {
  factory _$$ConceptsLoadedImplCopyWith(_$ConceptsLoadedImpl value,
          $Res Function(_$ConceptsLoadedImpl) then) =
      __$$ConceptsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Concept> concepts});
}

/// @nodoc
class __$$ConceptsLoadedImplCopyWithImpl<$Res>
    extends _$ConceptsStateCopyWithImpl<$Res, _$ConceptsLoadedImpl>
    implements _$$ConceptsLoadedImplCopyWith<$Res> {
  __$$ConceptsLoadedImplCopyWithImpl(
      _$ConceptsLoadedImpl _value, $Res Function(_$ConceptsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concepts = null,
  }) {
    return _then(_$ConceptsLoadedImpl(
      null == concepts
          ? _value._concepts
          : concepts // ignore: cast_nullable_to_non_nullable
              as List<Concept>,
    ));
  }
}

/// @nodoc

class _$ConceptsLoadedImpl implements ConceptsLoaded {
  const _$ConceptsLoadedImpl(final List<Concept> concepts)
      : _concepts = concepts;

  final List<Concept> _concepts;
  @override
  List<Concept> get concepts {
    if (_concepts is EqualUnmodifiableListView) return _concepts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_concepts);
  }

  @override
  String toString() {
    return 'ConceptsState.loaded(concepts: $concepts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConceptsLoadedImpl &&
            const DeepCollectionEquality().equals(other._concepts, _concepts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_concepts));

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConceptsLoadedImplCopyWith<_$ConceptsLoadedImpl> get copyWith =>
      __$$ConceptsLoadedImplCopyWithImpl<_$ConceptsLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Concept> concepts) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(concepts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Concept> concepts)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(concepts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Concept> concepts)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(concepts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ConceptsInitial value) initial,
    required TResult Function(ConceptsLoading value) loading,
    required TResult Function(ConceptsLoaded value) loaded,
    required TResult Function(ConceptsError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConceptsInitial value)? initial,
    TResult? Function(ConceptsLoading value)? loading,
    TResult? Function(ConceptsLoaded value)? loaded,
    TResult? Function(ConceptsError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConceptsInitial value)? initial,
    TResult Function(ConceptsLoading value)? loading,
    TResult Function(ConceptsLoaded value)? loaded,
    TResult Function(ConceptsError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ConceptsLoaded implements ConceptsState {
  const factory ConceptsLoaded(final List<Concept> concepts) =
      _$ConceptsLoadedImpl;

  List<Concept> get concepts;

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConceptsLoadedImplCopyWith<_$ConceptsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConceptsErrorImplCopyWith<$Res> {
  factory _$$ConceptsErrorImplCopyWith(
          _$ConceptsErrorImpl value, $Res Function(_$ConceptsErrorImpl) then) =
      __$$ConceptsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ConceptsErrorImplCopyWithImpl<$Res>
    extends _$ConceptsStateCopyWithImpl<$Res, _$ConceptsErrorImpl>
    implements _$$ConceptsErrorImplCopyWith<$Res> {
  __$$ConceptsErrorImplCopyWithImpl(
      _$ConceptsErrorImpl _value, $Res Function(_$ConceptsErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ConceptsErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConceptsErrorImpl implements ConceptsError {
  const _$ConceptsErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ConceptsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConceptsErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConceptsErrorImplCopyWith<_$ConceptsErrorImpl> get copyWith =>
      __$$ConceptsErrorImplCopyWithImpl<_$ConceptsErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Concept> concepts) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Concept> concepts)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Concept> concepts)? loaded,
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
    required TResult Function(ConceptsInitial value) initial,
    required TResult Function(ConceptsLoading value) loading,
    required TResult Function(ConceptsLoaded value) loaded,
    required TResult Function(ConceptsError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ConceptsInitial value)? initial,
    TResult? Function(ConceptsLoading value)? loading,
    TResult? Function(ConceptsLoaded value)? loaded,
    TResult? Function(ConceptsError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ConceptsInitial value)? initial,
    TResult Function(ConceptsLoading value)? loading,
    TResult Function(ConceptsLoaded value)? loaded,
    TResult Function(ConceptsError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ConceptsError implements ConceptsState {
  const factory ConceptsError(final String message) = _$ConceptsErrorImpl;

  String get message;

  /// Create a copy of ConceptsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConceptsErrorImplCopyWith<_$ConceptsErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
