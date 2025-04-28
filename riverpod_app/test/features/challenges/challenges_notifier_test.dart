import 'package:common/common.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/data/repositories/challenges_repository.dart';
import 'package:riverpod_app/data/repositories/concepts_repository.dart';
import 'package:riverpod_app/features/challenges/challenges_notifier.dart';

import '../../mocks.mocks.dart';

void main() {
  late MockChallengesRepository mockChallengesRepository;
  late MockConceptsRepository mockConceptsRepository;
  late List<AsyncValue<List<Challenge>>> states;

  final challenges = [
    Challenge(
      id: '1',
      question: {
        'en': 'What is 2+2?',
        'de': 'Was ist 2+2?',
      },
      options: [
        const Answer(id: 'a1', text: {'en': 'Four', 'de': 'Vier'}),
        const Answer(id: 'a2', text: {'en': 'Five', 'de': 'Fünf'}),
      ],
      correctAnswerIds: ['a1'],
    ),
    Challenge(
      id: '2',
      question: {
        'en': 'What is the capital of France?',
        'de': 'Was ist die Hauptstadt von Frankreich?',
      },
      options: [
        const Answer(id: 'b1', text: {'en': 'Paris', 'de': 'Paris'}),
        const Answer(id: 'b2', text: {'en': 'London', 'de': 'London'}),
      ],
      correctAnswerIds: ['b1'],
    ),
  ];

  final concepts = [
    Concept(
      id: '1',
      title: {'en': 'Concept 1', 'de': 'Konzept 1'},
      sections: [],
      challengeIds: [challenges.first.id],
    ),
    const Concept(
      id: 'conceptWithMissingChallenge',
      title: {'en': 'Concept 2', 'de': 'Konzept 2'},
      sections: [],
      challengeIds: ['3'], // Missing challenge ID
    ),
  ];

  final testException = Exception('Test error');

  ProviderSubscription<AsyncValue<List<Challenge>>> listenToNotifier(
    String conceptId,
  ) {
    final container = ProviderContainer(
      overrides: [
        challengesRepositoryProvider.overrideWithValue(
          mockChallengesRepository,
        ),
        conceptsRepositoryProvider.overrideWithValue(mockConceptsRepository),
      ],
    );
    addTearDown(container.dispose);

    states = [];
    return container.listen<AsyncValue<List<Challenge>>>(
      challengesNotifierProvider(conceptId),
      (_, next) => states.add(next),
      fireImmediately: true,
    );
  }

  setUp(() {
    mockChallengesRepository = MockChallengesRepository();
    mockConceptsRepository = MockConceptsRepository();

    when(mockConceptsRepository.getConcepts())
        .thenAnswer((_) async => concepts);
    when(mockChallengesRepository.getChallenges())
        .thenAnswer((_) async => challenges);
  });

  group('ChallengesNotifier', () {
    test('initial state is loading', () {
      listenToNotifier('1');
      expect(states, [const AsyncLoading<List<Challenge>>()]);
    });

    test(
      'emits [loading, data] when build succeeds',
      () => fakeAsync((async) {
        listenToNotifier('1');
        async.flushMicrotasks();

        expect(states, [
          isA<AsyncLoading<List<Challenge>>>(),
          isA<AsyncData<List<Challenge>>>()
              .having((d) => d.value, 'value', [challenges.first]),
        ]);

        verify(mockConceptsRepository.getConcepts()).called(1);
        verify(mockChallengesRepository.getChallenges()).called(1);
      }),
    );

    test(
      'emits [loading, error] when requested challenge is not found',
      () => fakeAsync((async) {
        listenToNotifier('conceptWithMissingChallenge');
        async.flushMicrotasks();

        expect(states, [
          isA<AsyncLoading<List<Challenge>>>(),
          isA<AsyncError<List<Challenge>>>().having(
            (e) => e.error.toString(),
            'error message',
            'Exception: Challenge with id 3 not found',
          ),
        ]);

        verify(mockConceptsRepository.getConcepts()).called(1);
        verify(mockChallengesRepository.getChallenges()).called(1);
      }),
    );

    test(
      'emits [loading, error] when concept is not found',
      () => fakeAsync((async) {
        when(mockConceptsRepository.getConcepts()).thenAnswer((_) async => []);

        listenToNotifier('missingConcept');
        async.flushMicrotasks();

        expect(states, [
          isA<AsyncLoading<List<Challenge>>>(),
          isA<AsyncError<List<Challenge>>>().having(
            (e) => e.error.toString(),
            'error message',
            'Exception: Concept with id missingConcept not found',
          ),
        ]);

        verify(mockConceptsRepository.getConcepts()).called(1);
        verifyNever(mockChallengesRepository.getChallenges());
      }),
    );

    test(
      'emits [loading, error] when getChallenges fails',
      () => fakeAsync((async) {
        when(mockChallengesRepository.getChallenges()).thenThrow(testException);

        listenToNotifier('1');
        async.flushMicrotasks();

        expect(states, [
          isA<AsyncLoading<List<Challenge>>>(),
          isA<AsyncError<List<Challenge>>>()
              .having((e) => e.error, 'error object', testException),
        ]);

        verify(mockConceptsRepository.getConcepts()).called(1);
        verify(mockChallengesRepository.getChallenges()).called(1);
      }),
    );

    test(
      'emits [loading, error] when getConcepts fails',
      () => fakeAsync((async) {
        when(mockConceptsRepository.getConcepts()).thenThrow(testException);

        listenToNotifier('1');
        async.flushMicrotasks();

        expect(states, [
          isA<AsyncLoading<List<Challenge>>>(),
          isA<AsyncError<List<Challenge>>>()
              .having((e) => e.error, 'error object', testException),
        ]);

        verify(mockConceptsRepository.getConcepts()).called(1);
        verifyNever(mockChallengesRepository.getChallenges());
      }),
    );
  });
}
