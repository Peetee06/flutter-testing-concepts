import 'package:common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/data/repositories/concepts_repository.dart';
import 'package:riverpod_app/data/services/rest_client.dart';

import '../../mocks.mocks.dart';

void main() {
  late MockRestClient mockRestClient;

  setUp(() {
    mockRestClient = MockRestClient();
  });

  ConceptsRepository getConceptsRepository() {
    final container = ProviderContainer.test(
      overrides: [
        restClientProvider.overrideWithValue(mockRestClient),
      ],
    );
    return container.read(conceptsRepositoryProvider);
  }

  group('conceptsRepositoryProvider', () {
    test('returns ConceptsRepository using the provided RestClient', () {
      final repository = getConceptsRepository();
      expect(repository.restClient, mockRestClient);
    });

    test('getConcepts delegates to RestClient', () async {
      final concepts = [
        const Concept(
          id: '1',
          title: {'en': 'Concept 1'},
          sections: [],
          challengeIds: ['c1'],
        ),
      ];
      when(mockRestClient.getConcepts()).thenAnswer((_) async => concepts);
      final repository = getConceptsRepository();
      final result = await repository.getConcepts();
      expect(result, concepts);
      verify(mockRestClient.getConcepts()).called(1);
    });

    test('getConcepts propagates errors from RestClient', () async {
      final error = Exception('client error');
      when(mockRestClient.getConcepts()).thenThrow(error);
      final repository = getConceptsRepository();
      expect(repository.getConcepts, throwsA(error));
    });
  });
}
