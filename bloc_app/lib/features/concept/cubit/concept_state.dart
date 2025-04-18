import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'concept_state.freezed.dart';

@freezed
sealed class ConceptState with _$ConceptState {
  const factory ConceptState.initial() = ConceptInitial;
  const factory ConceptState.loading() = ConceptLoading;
  const factory ConceptState.loaded(Concept concept) = ConceptLoaded;
  const factory ConceptState.error(String message) = ConceptError;
}
