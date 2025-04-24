import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/data/repositories/concepts_repository.dart';

part 'concepts_notifier.g.dart';

@riverpod
class ConceptsNotifier extends _$ConceptsNotifier {
  @override
  Future<List<Concept>> build() async {
    final repository = ref.watch(conceptsRepositoryProvider);
    return repository.getConcepts();
  }
}
