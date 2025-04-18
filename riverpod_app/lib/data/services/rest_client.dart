import 'package:common/common.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/app/config.dart';
import 'package:riverpod_app/data/services/interceptors/json_interceptor.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/mock_concepts.json')
  Future<List<Concept>> getConcepts();

  @GET('/mock_challenges.json')
  Future<List<Challenge>> getChallenges();
}

@riverpod
RestClient restClient(Ref ref) {
  final baseUrl = ref.watch(appConfigProvider.select((value) => value.baseUrl));
  final options = BaseOptions(
    baseUrl: baseUrl,
  );
  final dio = Dio(options)
    ..interceptors.addAll(
      [JsonInterceptor()],
    );
  return RestClient(dio);
}
