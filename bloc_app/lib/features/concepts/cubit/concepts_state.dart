import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'concepts_state.freezed.dart';

@freezed
sealed class ConceptsState with _$ConceptsState {
  const factory ConceptsState.initial() = ConceptsInitial;
  const factory ConceptsState.loading() = ConceptsLoading;
  const factory ConceptsState.loaded(List<Concept> concepts) = ConceptsLoaded;
  const factory ConceptsState.error(String message) = ConceptsError;
}
