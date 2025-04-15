import 'package:bloc_app/data/repositories/concepts/concepts_repository.dart';
import 'package:bloc_app/features/concept/cubit/concept_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConceptCubit extends Cubit<ConceptState> {
  ConceptCubit(this.conceptsRepository) : super(const ConceptState.initial());
  final ConceptsRepository conceptsRepository;

  Future<void> fetchConcept(String conceptId) async {
    emit(const ConceptState.loading());
    try {
      final concepts = await conceptsRepository.getConcepts();
      emit(
        ConceptState.loaded(
          concepts.firstWhere((concept) => concept.id == conceptId),
        ),
      );
    } catch (error, stackTrace) {
      switch (error) {
        case StateError():
          emit(const ConceptState.error('Concept not found'));
        default:
          emit(const ConceptState.error('Failed to fetch concept'));
      }
      addError(error, stackTrace);
    }
  }
}
