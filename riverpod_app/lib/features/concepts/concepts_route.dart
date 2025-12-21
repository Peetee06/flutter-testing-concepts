import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_app/features/challenges/view/challenges_view.dart';
import 'package:riverpod_app/features/concept/view/concept_view.dart';
import 'package:riverpod_app/features/concepts/view/concepts_view.dart';

part 'concepts_route.g.dart';
part 'package:riverpod_app/features/concept/concept_route.dart';
part 'package:riverpod_app/features/challenges/challenges_route.dart';

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
class ConceptsRoute extends GoRouteData with $ConceptsRoute {
  const ConceptsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ConceptsView();
  }
}
