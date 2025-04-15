import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/repositories/concepts/concepts_repository.dart';
import 'package:bloc_app/features/concepts/cubit/concepts_state.dart';

class ConceptsCubit extends Cubit<ConceptsState> {
  ConceptsCubit(this.conceptsRepository) : super(const ConceptsState.initial());
  final ConceptsRepository conceptsRepository;

  Future<void> fetchConcepts() async {
    try {
      emit(const ConceptsState.loading());
      final concepts = await conceptsRepository.getConcepts();
      emit(ConceptsState.loaded(concepts));
    } catch (error, stackTrace) {
      emit(const ConceptsState.error('Failed to fetch concepts'));
      addError(error, stackTrace);
    }
  }
}
