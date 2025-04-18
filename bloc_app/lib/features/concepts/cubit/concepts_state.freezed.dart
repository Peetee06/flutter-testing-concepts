// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
