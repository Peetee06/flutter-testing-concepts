import 'package:bloc_app/data/repositories/challenges/challenges_repository.dart';
import 'package:bloc_app/data/repositories/concepts/concepts_repository.dart';
import 'package:bloc_app/features/challenges/cubit/challenges_cubit.dart';
import 'package:bloc_app/features/challenges/view/challenges_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

@immutable
class ChallengesRoute extends GoRouteData {
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
