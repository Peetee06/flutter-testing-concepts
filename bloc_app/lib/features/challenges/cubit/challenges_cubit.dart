import 'package:bloc_app/data/repositories/challenges/challenges_repository.dart';
import 'package:bloc_app/data/repositories/concepts/concepts_repository.dart';
import 'package:bloc_app/features/challenges/cubit/challenges_state.dart';
import 'package:common/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChallengesCubit extends Cubit<ChallengesState> {
  ChallengesCubit({
    required this.challengesRepository,
    required this.conceptsRepository,
    required this.conceptId,
  }) : super(const ChallengesState.initial());

  final ChallengesRepository challengesRepository;
  final ConceptsRepository conceptsRepository;
  final String conceptId;

  Future<void> fetchChallenges() async {
    emit(const ChallengesState.loading());
    try {
      final challengeIds = await _getConceptChallengeIds();
      final challenges = await _getChallenges(challengeIds);
      emit(ChallengesState.loaded(challenges));
    } catch (e) {
      _handleError(e);
    }
  }

  /// Returns the challenge ids for the concept with the given [conceptId].
  ///
  /// Throws [StateError] if the concept with the given [conceptId]
  /// is not found.
  Future<List<String>> _getConceptChallengeIds() async {
    final concepts = await conceptsRepository.getConcepts();
    final concept = concepts.firstWhere((concept) => concept.id == conceptId);

    return concept.challengeIds;
  }

  /// Returns the challenges with the given [challengeIds].
  ///
  /// Throws [AssertionError] if any of the challenges with the given
  /// [challengeIds] are not found.
  Future<List<Challenge>> _getChallenges(List<String> challengeIds) async {
    final allChallenges = await challengesRepository.getChallenges();
    final challengesMapped = {
      for (final challenge in allChallenges) challenge.id: challenge,
    };

    return challengeIds.map((id) {
      final challenge = challengesMapped[id];
      assert(challenge != null, 'Challenge with id $id not found');
      return challenge!;
    }).toList();
  }

  void _handleError(Object e) {
    switch (e) {
      case AssertionError(:final message):
        emit(ChallengesState.error(message!.toString()));
        addError(Exception(message));
      case StateError():
        final message = 'Concept with id $conceptId not found';
        emit(ChallengesState.error(message));
        addError(Exception(message));
      default:
        emit(const ChallengesState.error('Failed to fetch challenges'));
        addError(e);
    }
  }
}
