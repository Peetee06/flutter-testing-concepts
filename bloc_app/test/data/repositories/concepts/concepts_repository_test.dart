import 'package:bloc_app/data/repositories/concepts/concepts_repository.dart';
import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks.mocks.dart';

void main() {
  late MockRestClient restClient;

  setUp(() {
    restClient = MockRestClient();
  });

  group(ConceptsRepository, () {
    test('getConcepts returns a list of concepts', () async {
      when(restClient.getConcepts()).thenAnswer(
        (_) async => [
          Concept(
            id: '1',
            title: {
              'en': 'Concept 1',
              'de': 'Konzept 1',
            },
            sections: [
              Section(
                content: [
                  ContentComponent.image(
                    imageUri: Uri.parse('https://example.com/image.png'),
                  ),
                  const ContentComponent.text(
                    text: {
                      'en': 'Text 1',
                      'de': 'Text 1',
                    },
                  ),
                ],
              ),
            ],
            challengeIds: ['1', '2'],
          ),
          Concept(
            id: '2',
            title: {
              'en': 'Concept 2',
              'de': 'Konzept 2',
            },
            sections: [
              Section(
                content: [
                  ContentComponent.image(
                    imageUri: Uri.parse('https://example.com/image2.png'),
                  ),
                  const ContentComponent.text(
                    text: {
                      'en': 'Text 2',
                      'de': 'Text 2',
                    },
                  ),
                ],
              ),
            ],
            challengeIds: ['3', '4'],
          ),
        ],
      );
      final repository = ConceptsRepository(
        restClient: restClient,
      );

      final concepts = await repository.getConcepts();

      expect(
        concepts,
        [
          Concept(
            id: '1',
            title: {'en': 'Concept 1', 'de': 'Konzept 1'},
            sections: [
              Section(
                content: [
                  ContentComponent.image(
                    imageUri: Uri.parse('https://example.com/image.png'),
                  ),
                  const ContentComponent.text(
                    text: {'en': 'Text 1', 'de': 'Text 1'},
                  ),
                ],
              ),
            ],
            challengeIds: ['1', '2'],
          ),
          Concept(
            id: '2',
            title: {'en': 'Concept 2', 'de': 'Konzept 2'},
            sections: [
              Section(
                content: [
                  ContentComponent.image(
                    imageUri: Uri.parse('https://example.com/image2.png'),
                  ),
                  const ContentComponent.text(
                    text: {'en': 'Text 2', 'de': 'Text 2'},
                  ),
                ],
              ),
            ],
            challengeIds: ['3', '4'],
          ),
        ],
      );
    });
  });
}
