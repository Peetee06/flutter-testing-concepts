part of 'package:riverpod_app/features/concepts/concepts_route.dart';

class ChallengesRoute extends GoRouteData with $ChallengesRoute {
  const ChallengesRoute({required this.id});
  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChallengesView(conceptId: id);
  }
}
