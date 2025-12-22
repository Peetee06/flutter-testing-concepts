import 'package:common/common.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/data/repositories/concepts_repository.dart';
import 'package:riverpod_app/utils/retry.dart';

part 'concepts_provider.g.dart';

@Riverpod(retry: networkRetry)
Future<List<Concept>> concepts(Ref ref) async {
  final repository = ref.watch(conceptsRepositoryProvider);
  return repository.getConcepts();
}
