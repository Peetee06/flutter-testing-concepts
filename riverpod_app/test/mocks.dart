import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:riverpod_app/data/repositories/concepts_repository.dart';
import 'package:riverpod_app/data/services/rest_client.dart';

@GenerateMocks([
  Dio,
  ResponseInterceptorHandler,
  Response,
  RestClient,
  ConceptsRepository,
])
class GeneratedMocks {}
