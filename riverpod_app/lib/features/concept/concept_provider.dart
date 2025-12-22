import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/data/repositories/concepts_repository.dart';
import 'package:riverpod_app/utils/retry.dart';

part 'concept_provider.g.dart';

@Riverpod(retry: networkRetry)
Future<Concept> concept(Ref ref, String id) async {
  final repository = ref.watch(conceptsRepositoryProvider);
  final concepts = await repository.getConcepts();
  return concepts.firstWhere(
    (concept) => concept.id == id,
    orElse: () => throw Exception('Concept not found'),
  );
}
