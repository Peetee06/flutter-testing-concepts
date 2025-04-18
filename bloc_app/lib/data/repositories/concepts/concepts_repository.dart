import 'package:bloc_app/data/services/rest_client.dart';
import 'package:common/common.dart';

class ConceptsRepository {
  ConceptsRepository({
    required this.restClient,
  });

  final RestClient restClient;

  Future<List<Concept>> getConcepts() async {
    return restClient.getConcepts();
  }
}
