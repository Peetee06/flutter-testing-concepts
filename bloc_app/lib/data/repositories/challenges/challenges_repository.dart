import 'package:bloc_app/data/services/rest_client.dart';
import 'package:common/common.dart';

class ChallengesRepository {
  ChallengesRepository({
    required this.restClient,
  });

  final RestClient restClient;

  Future<List<Challenge>> getChallenges() async {
    return restClient.getChallenges();
  }
}
