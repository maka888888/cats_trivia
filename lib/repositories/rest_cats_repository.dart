import 'package:cat_trivia/models/cat_fact_model.dart';
import 'package:dio/dio.dart';

import '../services/cat_facts_api.dart';

class RestCatsRepository {
  final dio = Dio();

  Future<CatFactModel> getCatFact() async {
    final RestClient client = RestClient(dio);
    final CatFactModel catFact = await client.getCatFact();
    return catFact;
  }
}
