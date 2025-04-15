import 'package:bloc_app/data/repositories/challenges/challenges_repository.dart';
import 'package:bloc_app/data/repositories/concepts/concepts_repository.dart';
import 'package:bloc_app/data/services/rest_client.dart';
import 'package:bloc_app/features/challenges/cubit/challenges_cubit.dart';
import 'package:bloc_app/features/concept/cubit/concept_cubit.dart';
import 'package:bloc_app/features/concepts/cubit/concepts_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  CacheManager,
  Dio,
  GoRouter,
  HttpClientAdapter,
  ConceptCubit,
  ConceptsCubit,
  ConceptsRepository,
  RestClient,
  ChallengesCubit,
  ChallengesRepository,
])
class GeneratedMocks {}
