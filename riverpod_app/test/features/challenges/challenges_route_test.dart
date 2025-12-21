import 'package:common/common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/features/challenges/challenges_notifier.dart';
import 'package:riverpod_app/features/challenges/view/challenges_view.dart';
import 'package:riverpod_app/features/concepts/concepts_route.dart';
import 'package:riverpod_app/routing/go_router.dart';

import '../../helpers/helpers.dart';

void main() {
  group(ChallengesRoute, () {
    testWidgets('renders $ChallengesView when navigating to the route',
        (tester) async {
      const testConceptId = 'test_concept_id';
      await tester.pumpAppWithRouter(
        overrides: [
          challengesProvider(testConceptId).overrideWithBuild(
            (_, __) => <Challenge>[],
          ),
        ],
        router: router(
          initialLocation: const ChallengesRoute(id: testConceptId).location,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ChallengesView), findsOneWidget);
    });
  });
}
