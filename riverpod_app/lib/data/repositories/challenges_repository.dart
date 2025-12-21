import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/data/services/rest_client.dart';

part 'challenges_repository.g.dart';

class ChallengesRepository {
  ChallengesRepository({required this.restClient});
  final RestClient restClient;
  Future<List<Challenge>> getChallenges() async => restClient.getChallenges();
}

@riverpod
ChallengesRepository challengesRepository(Ref ref) {
  return ChallengesRepository(restClient: ref.watch(restClientProvider));
}
