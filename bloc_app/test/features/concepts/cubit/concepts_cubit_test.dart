import 'package:bloc_app/domain/concept.dart';
import 'package:bloc_app/domain/content_component.dart';
import 'package:bloc_app/domain/section.dart';
import 'package:bloc_app/features/concepts/cubit/concepts_cubit.dart';
import 'package:bloc_app/features/concepts/cubit/concepts_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  late MockConceptsRepository mockRepository;

  setUp(() {
    mockRepository = MockConceptsRepository();
  });

  final concepts = [
    Concept(
      id: '1',
      title: {
        'en': 'Test Concept',
        'de': 'Test Konzept',
      },
      sections: [
        Section(
          content: [
            const ContentComponent.text(
              text: {
                'en': 'Hello',
                'de': 'Hallo',
              },
            ),
            ContentComponent.image(
              imageUri: Uri.parse('https://example.com/image.jpg'),
            ),
          ],
        ),
      ],
      challengeIds: ['1'],
    ),
  ];

  group(ConceptsCubit, () {
    test('initial state is ConceptsInitial', () {
      expect(
        ConceptsCubit(mockRepository).state,
        const ConceptsState.initial(),
      );
    });

    blocTest<ConceptsCubit, ConceptsState>(
      'emits [loading, loaded] when fetchConcepts succeeds',
      setUp: () {
        when(mockRepository.getConcepts()).thenAnswer((_) async => concepts);
      },
      build: () => ConceptsCubit(mockRepository),
      act: (cubit) => cubit.fetchConcepts(),
      expect: () => [
        const ConceptsState.loading(),
        ConceptsState.loaded(concepts),
      ],
    );

    blocTest<ConceptsCubit, ConceptsState>(
      'emits [loading, error] when fetchConcepts fails',
      setUp: () {
        when(mockRepository.getConcepts()).thenThrow(Exception('Test error'));
      },
      build: () => ConceptsCubit(mockRepository),
      act: (cubit) => cubit.fetchConcepts(),
      expect: () => const [
        ConceptsState.loading(),
        ConceptsState.error('Failed to fetch concepts'),
      ],
      verify: (_) {
        verify(mockRepository.getConcepts()).called(1);
      },
      errors: () => [
        isA<Exception>().having(
          (e) => e.toString(),
          'error',
          'Exception: Test error',
        ),
      ],
    );
  });
}
