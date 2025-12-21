part of 'package:bloc_app/features/concepts/concepts_route.dart';

class ChallengesRoute extends GoRouteData with $ChallengesRoute {
  const ChallengesRoute({required this.id});

  /// The id of the concept to fetch the challenges for.
  final String id;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => ChallengesCubit(
        challengesRepository: GetIt.I<ChallengesRepository>(),
        conceptsRepository: GetIt.I<ConceptsRepository>(),
        conceptId: id,
      )..fetchChallenges(),
      child: const ChallengesView(),
    );
  }
}
