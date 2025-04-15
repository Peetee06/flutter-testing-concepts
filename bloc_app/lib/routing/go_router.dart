import 'package:bloc_app/features/concepts/concepts_route.dart';
import 'package:go_router/go_router.dart';

GoRouter router({String? initialLocation}) => GoRouter(
      initialLocation: initialLocation ?? ConceptsRoute().location,
      routes: $appRoutes,
    );
