import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_app/features/concepts/view/concepts_view.dart';

part 'concepts_route.g.dart';

@TypedGoRoute<ConceptsRoute>(
  path: '/concepts',
  name: 'concepts',
)
class ConceptsRoute extends GoRouteData {
  const ConceptsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ConceptsView();
  }
}
