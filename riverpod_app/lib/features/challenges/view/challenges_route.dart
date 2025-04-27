import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_app/features/challenges/view/challenges_view.dart';

class ChallengesRoute extends GoRouteData {
  const ChallengesRoute({required this.id});
  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChallengesView(conceptId: id);
  }
}
