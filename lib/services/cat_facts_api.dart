import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../models/cat_fact_model.dart';

part 'cat_facts_api.g.dart';

@RestApi(baseUrl: "https://cat-fact.herokuapp.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('facts/random?animal_type=cat&amount=1')
  Future<CatFactModel> getCatFact();
}
