import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:mockito/annotations.dart';
import 'package:riverpod_app/data/repositories/challenges_repository.dart';
import 'package:riverpod_app/data/repositories/concepts_repository.dart';
import 'package:riverpod_app/data/services/rest_client.dart';

@GenerateMocks([
  BaseCacheManager,
  ChallengesRepository,
  ConceptsRepository,
  Dio,
  GoRouter,
  Response,
  ResponseInterceptorHandler,
  RestClient,
])
class GeneratedMocks {}
