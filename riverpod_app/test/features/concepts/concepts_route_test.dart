import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/concepts/concepts_notifier.dart';
import 'package:riverpod_app/features/concepts/concepts_route.dart';
import 'package:riverpod_app/features/concepts/view/concepts_view.dart';
import 'package:riverpod_app/routing/go_router.dart';

import '../../helpers/pump_app.dart';
import 'fake_concepts_notifier.dart';

void main() {
  group(ConceptsRoute, () {
    testWidgets('renders $ConceptsView', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpAppWithRouter(
          router: router(),
          overrides: [
            conceptsNotifierProvider.overrideWith(
              () => FakeConceptsNotifier(concepts: []),
            ),
          ],
        );
        await tester.pumpAndSettle();
        expect(find.byType(ConceptsView), findsOneWidget);
      });
    });
  });
}
