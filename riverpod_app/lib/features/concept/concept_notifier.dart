import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/data/repositories/concepts_repository.dart';

part 'concept_notifier.g.dart';

@riverpod
class ConceptNotifier extends _$ConceptNotifier {
  @override
  Future<Concept> build(String id) async {
    final repository = ref.watch(conceptsRepositoryProvider);
    final concepts = await repository.getConcepts();
    return concepts.firstWhere(
      (concept) => concept.id == id,
      orElse: () => throw Exception('Concept not found'),
    );
  }
}
