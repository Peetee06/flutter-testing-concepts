import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/data/repositories/challenges_repository.dart';
import 'package:riverpod_app/data/services/rest_client.dart';

import '../../helpers/helpers.dart';
import '../../mocks.mocks.dart';

void main() {
  late MockRestClient mockRestClient;

  setUp(() {
    mockRestClient = MockRestClient();
  });

  ChallengesRepository getChallengesRepository() {
    final container = createContainer(
      overrides: [
        restClientProvider.overrideWithValue(mockRestClient),
      ],
    );
    return container.read(challengesRepositoryProvider);
  }

  group('challengesRepositoryProvider', () {
    test('returns ChallengesRepository using the provided RestClient', () {
      final repository = getChallengesRepository();
      expect(repository.restClient, mockRestClient);
    });

    test('getChallenges delegates to RestClient', () async {
      final challenges = [
        Challenge(
          id: '1',
          question: {'en': 'Q1'},
          options: [
            const Answer(id: 'a', text: {'en': 'A'}),
          ],
          correctAnswerIds: ['a'],
        ),
      ];
      when(mockRestClient.getChallenges()).thenAnswer((_) async => challenges);
      final repository = getChallengesRepository();
      final result = await repository.getChallenges();
      expect(result, challenges);
      verify(mockRestClient.getChallenges()).called(1);
    });

    test('getChallenges propagates errors from RestClient', () async {
      final error = Exception('client error');
      when(mockRestClient.getChallenges()).thenThrow(error);
      final repository = getChallengesRepository();
      expect(repository.getChallenges, throwsA(error));
    });
  });
}
