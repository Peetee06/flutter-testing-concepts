import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/concept/concept_provider.dart';
import 'package:riverpod_app/features/concept/view/concept_view.dart';
import 'package:riverpod_app/features/concepts/concepts_route.dart';
import 'package:riverpod_app/routing/go_router.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(ConceptRoute, () {
    testWidgets('renders ConceptView', (tester) async {
      final concept = Concept(
        id: 'test-id',
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
      await tester.pumpAppWithRouter(
        router: router(
          initialLocation: const ConceptRoute(id: 'test-id').location,
        ),
        overrides: [
          conceptProvider(concept.id).overrideWith(
            (_) => concept,
          ),
        ],
      );
      await tester.pumpAndSettle();
      expect(find.byType(ConceptView), findsOneWidget);
    });
  });
}
