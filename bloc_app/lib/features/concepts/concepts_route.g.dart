// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concepts_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $conceptsRoute,
    ];

RouteBase get $conceptsRoute => GoRouteData.$route(
      path: '/concepts',
      name: 'concepts',
      factory: $ConceptsRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: ':id',
          name: 'concept',
          factory: $ConceptRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'challenges',
              name: 'challenges',
              factory: $ChallengesRoute._fromState,
            ),
          ],
        ),
      ],
    );

mixin $ConceptsRoute on GoRouteData {
  static ConceptsRoute _fromState(GoRouterState state) => const ConceptsRoute();

  @override
  String get location => GoRouteData.$location(
        '/concepts',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ConceptRoute on GoRouteData {
  static ConceptRoute _fromState(GoRouterState state) => ConceptRoute(
        id: state.pathParameters['id']!,
      );

  ConceptRoute get _self => this as ConceptRoute;

  @override
  String get location => GoRouteData.$location(
        '/concepts/${Uri.encodeComponent(_self.id)}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ChallengesRoute on GoRouteData {
  static ChallengesRoute _fromState(GoRouterState state) => ChallengesRoute(
        id: state.pathParameters['id']!,
      );

  ChallengesRoute get _self => this as ChallengesRoute;

  @override
  String get location => GoRouteData.$location(
        '/concepts/${Uri.encodeComponent(_self.id)}/challenges',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
