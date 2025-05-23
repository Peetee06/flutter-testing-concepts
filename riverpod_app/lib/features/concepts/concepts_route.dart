import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_app/features/challenges/view/challenges_route.dart';
import 'package:riverpod_app/features/concept/concept_route.dart';
import 'package:riverpod_app/features/concepts/view/concepts_view.dart';

part 'concepts_route.g.dart';

@TypedGoRoute<ConceptsRoute>(
  path: '/concepts',
  name: 'concepts',
  routes: [
    TypedGoRoute<ConceptRoute>(
      path: ':id',
      name: 'concept',
      routes: [
        TypedGoRoute<ChallengesRoute>(
          path: 'challenges',
          name: 'challenges',
        ),
      ],
    ),
  ],
)
class ConceptsRoute extends GoRouteData {
  const ConceptsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ConceptsView();
  }
}
