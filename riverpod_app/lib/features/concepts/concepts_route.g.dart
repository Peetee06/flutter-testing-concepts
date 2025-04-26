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
      factory: $ConceptsRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: ':id',
          name: 'concept',
          factory: $ConceptRouteExtension._fromState,
        ),
      ],
    );

extension $ConceptsRouteExtension on ConceptsRoute {
  static ConceptsRoute _fromState(GoRouterState state) => const ConceptsRoute();

  String get location => GoRouteData.$location(
        '/concepts',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ConceptRouteExtension on ConceptRoute {
  static ConceptRoute _fromState(GoRouterState state) => ConceptRoute(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/concepts/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
