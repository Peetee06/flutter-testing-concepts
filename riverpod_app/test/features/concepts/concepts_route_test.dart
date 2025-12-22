import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/concepts/concepts_provider.dart';
import 'package:riverpod_app/features/concepts/concepts_route.dart';
import 'package:riverpod_app/features/concepts/view/concepts_view.dart';
import 'package:riverpod_app/routing/go_router.dart';

import '../../helpers/pump_app.dart';

void main() {
  group(ConceptsRoute, () {
    testWidgets('renders $ConceptsView', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpAppWithRouter(
          router: router(),
          overrides: [
            conceptsProvider.overrideWith(
              (_) => <Concept>[],
            ),
          ],
        );
        await tester.pumpAndSettle();
        expect(find.byType(ConceptsView), findsOneWidget);
      });
    });
  });
}
