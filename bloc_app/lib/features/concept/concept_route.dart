part of 'package:bloc_app/features/concepts/concepts_route.dart';

class ConceptRoute extends GoRouteData with $ConceptRoute {
  const ConceptRoute({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => ConceptCubit(
        GetIt.I<ConceptsRepository>(),
      )..fetchConcept(id),
      child: const ConceptView(),
    );
  }
}
