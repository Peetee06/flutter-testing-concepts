import 'package:common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/data/repositories/concepts_repository.dart';
import 'package:riverpod_app/features/concept/concept_provider.dart';

import '../../mocks.mocks.dart';

void main() {
  group('conceptProvider', () {
    late MockConceptsRepository mockRepository;
    final concept = Concept(
      id: '1',
      title: {'en': 'Test Concept', 'de': 'Test Konzept'},
      sections: [
        Section(
          content: [
            const ContentComponent.text(text: {'en': 'Hello', 'de': 'Hallo'}),
            ContentComponent.image(
              imageUri: Uri.parse('https://example.com/image.jpg'),
            ),
          ],
        ),
      ],
      challengeIds: ['1', '2'],
    );

    setUp(() {
      mockRepository = MockConceptsRepository();
    });

    Future<Concept> getConcept({
      required String id,
    }) async {
      final container = ProviderContainer.test(
        overrides: [
          conceptsRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );
      return container.read(conceptProvider(id).future);
    }

    test('returns a concept for a valid id', () async {
      when(mockRepository.getConcepts()).thenAnswer((_) async => [concept]);
      final result = await getConcept(id: '1');
      expect(result, concept);
      verify(mockRepository.getConcepts()).called(1);
    });

    test('throws error for non-existent concept', () async {
      when(mockRepository.getConcepts()).thenAnswer((_) async => []);
      expect(
        () => getConcept(id: 'nonexistent'),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'error',
            contains('Concept not found'),
          ),
        ),
      );
      verify(mockRepository.getConcepts()).called(1);
    });

    test('throws error when repository throws', () async {
      final error = Exception('Test error');
      when(mockRepository.getConcepts()).thenThrow(error);
      expect(
        () => getConcept(id: '1'),
        throwsA(error),
      );
      verify(mockRepository.getConcepts()).called(1);
    });
  });
}
