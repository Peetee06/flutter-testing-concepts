// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
