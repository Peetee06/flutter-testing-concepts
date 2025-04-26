import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_app/features/concept/view/concept_view.dart';

class ConceptRoute extends GoRouteData {
  const ConceptRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ConceptView(id: id);
  }
}
