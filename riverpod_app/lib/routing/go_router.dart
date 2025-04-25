import 'package:go_router/go_router.dart';
import 'package:riverpod_app/features/concepts/concepts_route.dart';

GoRouter router({String? initialLocation}) => GoRouter(
      initialLocation: initialLocation ?? const ConceptsRoute().location,
      routes: $appRoutes,
    );
