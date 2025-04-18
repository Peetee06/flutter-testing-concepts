import 'package:bloc_app/data/services/rest_client.dart';
import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mocks.mocks.dart';

void main() {
  group('RestClient', () {
    late MockDio mockDio;
    late RestClient restClient;

    setUp(() {
      mockDio = MockDio();
      when(mockDio.options).thenReturn(
        BaseOptions(
          baseUrl: RestClient.baseUrl,
        ),
      );
      restClient = RestClient(mockDio);
    });

    group('getConcepts', () {
      test('returns list of Concept on successful request', () async {
        final responseData = [
          {
            'id': '1',
            'title': {'en': 'Concept 1', 'de': 'Konzept 1'},
            'sections': [
              {
                'content': [
                  {
                    'type': 'text',
                    'text': {'en': 'Hello', 'de': 'Hallo'},
                  },
                  {
                    'type': 'image',
                    'imageUri': 'https://example.com/image.jpg',
                  },
                ],
              },
            ],
            'challengeIds': ['challenge1', 'challenge2'],
          },
        ];

        when(
          mockDio.fetch<List<dynamic>>(any),
        ).thenAnswer(
          (_) async => Response(
            data: responseData,
            statusCode: 200,
            requestOptions: RequestOptions(),
          ),
        );

        final result = await restClient.getConcepts();

        expect(
          result,
          [
            Concept(
              id: '1',
              title: {'en': 'Concept 1', 'de': 'Konzept 1'},
              sections: [
                Section(
                  content: [
                    const ContentComponent.text(
                      text: {'en': 'Hello', 'de': 'Hallo'},
                    ),
                    ContentComponent.image(
                      imageUri: Uri.parse('https://example.com/image.jpg'),
                    ),
                  ],
                ),
              ],
              challengeIds: ['challenge1', 'challenge2'],
            ),
          ],
        );
      });

      test('throws exception on error response', () async {
        when(
          mockDio.fetch<List<dynamic>>(any),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        expect(
          () => restClient.getConcepts(),
          throwsA(isA<DioException>()),
        );
      });
    });

    group('getChallenges', () {
      test('returns list of Challenge on successful request', () async {
        final responseData = [
          {
            'id': '1',
            'question': {'en': 'Challenge 1', 'de': 'Herausforderung 1'},
            'options': [
              {
                'id': 'a1',
                'text': {'en': 'Option 1', 'de': 'Option 1'},
              },
              {
                'id': 'a2',
                'text': {'en': 'Option 2', 'de': 'Option 2'},
              },
            ],
            'correctAnswerIds': ['a1'],
          },
        ];

        when(
          mockDio.fetch<List<dynamic>>(any),
        ).thenAnswer(
          (_) async => Response(
            data: responseData,
            statusCode: 200,
            requestOptions: RequestOptions(),
          ),
        );

        final result = await restClient.getChallenges();

        expect(
          result,
          [
            Challenge(
              id: '1',
              question: {'en': 'Challenge 1', 'de': 'Herausforderung 1'},
              options: [
                const Answer(
                  id: 'a1',
                  text: {'en': 'Option 1', 'de': 'Option 1'},
                ),
                const Answer(
                  id: 'a2',
                  text: {'en': 'Option 2', 'de': 'Option 2'},
                ),
              ],
              correctAnswerIds: ['a1'],
            ),
          ],
        );
      });

      test('throws exception on error response', () async {
        when(
          mockDio.fetch<List<dynamic>>(any),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(),
            ),
          ),
        );

        expect(
          () => restClient.getChallenges(),
          throwsA(isA<DioException>()),
        );
      });
    });
  });
}
