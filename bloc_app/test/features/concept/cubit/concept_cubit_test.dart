import 'package:bloc_app/features/concept/cubit/concept_cubit.dart';
import 'package:bloc_app/features/concept/cubit/concept_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  late MockConceptsRepository mockRepository;

  setUp(() {
    mockRepository = MockConceptsRepository();
  });

  final concept = Concept(
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
    challengeIds: ['1', '2'],
  );

  group(ConceptCubit, () {
    test('initial state is ConceptInitial', () {
      expect(
        ConceptCubit(mockRepository).state,
        const ConceptState.initial(),
      );
    });

    blocTest<ConceptCubit, ConceptState>(
      'emits [loading, loaded] when fetchConcept succeeds',
      setUp: () {
        when(mockRepository.getConcepts()).thenAnswer((_) async => [concept]);
      },
      build: () => ConceptCubit(mockRepository),
      act: (cubit) => cubit.fetchConcept('1'),
      expect: () => [
        const ConceptState.loading(),
        ConceptState.loaded(concept),
      ],
    );

    blocTest<ConceptCubit, ConceptState>(
      'emits [loading, error] when fetchConcept fails',
      setUp: () {
        when(mockRepository.getConcepts()).thenThrow(Exception('Test error'));
      },
      build: () => ConceptCubit(mockRepository),
      act: (cubit) => cubit.fetchConcept('1'),
      expect: () => const [
        ConceptState.loading(),
        ConceptState.error('Failed to fetch concept'),
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

    blocTest<ConceptCubit, ConceptState>(
      'emits [loading, error] when concept does not exist',
      setUp: () {
        when(mockRepository.getConcepts()).thenAnswer((_) async => []);
      },
      build: () => ConceptCubit(mockRepository),
      act: (cubit) => cubit.fetchConcept('nonexistent'),
      expect: () => const [
        ConceptState.loading(),
        ConceptState.error('Concept not found'),
      ],
      verify: (_) {
        verify(mockRepository.getConcepts()).called(1);
      },
    );
  });
}
