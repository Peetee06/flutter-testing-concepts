import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_app/app/config.dart';
import 'package:riverpod_app/data/services/interceptors/json_interceptor.dart';
import 'package:riverpod_app/data/services/rest_client.dart';

import '../../mocks.mocks.dart';

void main() {
  group('dioProvider', () {
    Dio getDio({required AppConfig config}) {
      final container = ProviderContainer(
        overrides: [
          appConfigProvider.overrideWithValue(config),
        ],
      );
      addTearDown(container.dispose);
      return container.read(dioProvider);
    }

    test('should create Dio instance with correct base URL and interceptor',
        () {
      const config = AppConfig(baseUrl: 'http://mock.com');
      final dio = getDio(config: config);

      expect(
        dio,
        isA<Dio>()
            .having(
              (dio) => dio.options.baseUrl,
              'baseUrl',
              config.baseUrl,
            )
            .having(
              (dio) => dio.interceptors,
              'interceptors',
              contains(isA<JsonInterceptor>()),
            ),
      );
    });
  });

  group('restClientProvider', () {
    late MockDio dio;

    setUp(() {
      dio = MockDio();
      when(dio.options).thenReturn(
        BaseOptions(
          baseUrl: 'http://mock.com',
        ),
      );
    });

    RestClient getRestClient() {
      final container = ProviderContainer(
        overrides: [
          dioProvider.overrideWithValue(dio),
        ],
      );
      addTearDown(container.dispose);
      return container.read(restClientProvider);
    }

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
        final restClient = getRestClient();

        when(
          dio.fetch<List<dynamic>>(
            argThat(
              predicate<RequestOptions>(
                (options) => options.path.contains('/mock_concepts.json'),
              ),
            ),
          ),
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
          dio.fetch<List<dynamic>>(
            argThat(
              predicate<RequestOptions>(
                (options) => options.path.contains('/mock_concepts.json'),
              ),
            ),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(),
            ),
          ),
        );
        final restClient = getRestClient();

        expect(
          restClient.getConcepts,
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
          dio.fetch<List<dynamic>>(
            argThat(
              predicate<RequestOptions>(
                (options) => options.path.contains('/mock_challenges.json'),
              ),
            ),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: responseData,
            statusCode: 200,
            requestOptions: RequestOptions(),
          ),
        );
        final restClient = getRestClient();

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
          dio.fetch<List<dynamic>>(
            argThat(
              predicate<RequestOptions>(
                (options) => options.path.contains('/mock_challenges.json'),
              ),
            ),
          ),
        ).thenThrow(
          DioException(
            requestOptions: RequestOptions(),
            response: Response(
              statusCode: 404,
              requestOptions: RequestOptions(),
            ),
          ),
        );
        final restClient = getRestClient();

        expect(
          restClient.getChallenges,
          throwsA(isA<DioException>()),
        );
      });
    });
  });
}
