import 'package:bloc_app/domain/challenge.dart';
import 'package:bloc_app/domain/concept.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(
  baseUrl: RestClient.baseUrl,
)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static const baseUrl =
      'https://raw.githubusercontent.com/Peetee06/flutter-testing-concepts/refs/heads/main/';

  @GET('/mock_concepts.json')
  Future<List<Concept>> getConcepts();

  @GET('/mock_challenges.json')
  Future<List<Challenge>> getChallenges();
}
