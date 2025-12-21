import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/data/services/rest_client.dart';

part 'concepts_repository.g.dart';

class ConceptsRepository {
  ConceptsRepository({required this.restClient});
  final RestClient restClient;
  Future<List<Concept>> getConcepts() async => restClient.getConcepts();
}

@riverpod
ConceptsRepository conceptsRepository(Ref ref) {
  return ConceptsRepository(restClient: ref.watch(restClientProvider));
}
