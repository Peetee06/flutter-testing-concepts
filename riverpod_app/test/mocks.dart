import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:riverpod_app/data/services/rest_client.dart';

@GenerateMocks([
  Dio,
  ResponseInterceptorHandler,
  Response,
  RestClient,
])
class GeneratedMocks {}
