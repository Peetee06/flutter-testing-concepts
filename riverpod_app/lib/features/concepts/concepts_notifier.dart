import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/data/repositories/concepts_repository.dart';
import 'package:riverpod_app/utils/retry.dart';

part 'concepts_notifier.g.dart';

@Riverpod(retry: networkRetry)
class ConceptsNotifier extends _$ConceptsNotifier {
  @override
  Future<List<Concept>> build() async {
    final repository = ref.watch(conceptsRepositoryProvider);
    return repository.getConcepts();
  }
}
