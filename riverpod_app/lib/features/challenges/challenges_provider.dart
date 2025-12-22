import 'package:collection/collection.dart';
import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/data/repositories/challenges_repository.dart';
import 'package:riverpod_app/data/repositories/concepts_repository.dart';
import 'package:riverpod_app/utils/retry.dart';

part 'challenges_provider.g.dart';

@Riverpod(retry: networkRetry)
Future<List<Challenge>> challenges(Ref ref, String conceptId) async {
  final concept = await _fetchAndFindConcept(ref, conceptId);
  return _fetchAndFilterChallengesForConcept(ref, concept);
}

Future<Concept> _fetchAndFindConcept(Ref ref, String conceptId) async {
  final conceptsRepository = ref.watch(conceptsRepositoryProvider);
  final concepts = await conceptsRepository.getConcepts();
  final concept = concepts.firstWhereOrNull((c) => c.id == conceptId);

  if (concept == null) {
    throw Exception('Concept with id $conceptId not found');
  }
  return concept;
}

Future<List<Challenge>> _fetchAndFilterChallengesForConcept(
  Ref ref,
  Concept concept,
) async {
  final challengesRepository = ref.watch(challengesRepositoryProvider);
  final challenges = await challengesRepository.getChallenges();

  final challengeMap = {
    for (final challenge in challenges) challenge.id: challenge,
  };

  return concept.challengeIds.map((id) {
    final challenge = challengeMap[id];
    if (challenge == null) {
      throw Exception('Challenge with id $id not found');
    }
    return challenge;
  }).toList();
}
