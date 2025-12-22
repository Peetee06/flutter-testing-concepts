import 'package:common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/data/repositories/concepts_repository.dart';
import 'package:riverpod_app/features/concepts/concepts_notifier.dart';

import '../../mocks.mocks.dart';

void main() {
  late MockConceptsRepository mockRepository;

  setUp(() {
    mockRepository = MockConceptsRepository();
  });

  Future<List<Concept>> readConcepts() async {
    final container = ProviderContainer.test(
      overrides: [
        conceptsRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
    return await container.read(conceptsProvider.future);
  }

  test('returns concepts when fetch is successful', () async {
    final concepts = <Concept>[
      const Concept(
        id: '1',
        title: {'en': 'Test Concept'},
        sections: [],
        challengeIds: [],
      ),
    ];
    when(mockRepository.getConcepts()).thenAnswer((_) async => concepts);
    final result = await readConcepts();
    expect(result, concepts);
  });

  test('throws when fetch fails', () async {
    when(mockRepository.getConcepts()).thenThrow(Exception('fail'));
    expect(
      readConcepts,
      throwsA(isA<Exception>()),
    );
  });
}
