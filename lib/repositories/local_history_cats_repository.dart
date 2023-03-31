import 'package:cat_trivia/models/cat_fact_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class LocalHistoryCatsRepository {
  var catsBox = Hive.box('cats');

  Future<void> addCatFact(CatFactModel catFact) async {
    await catsBox.put(DateTime.now().toString(), catFact.toJson());
  }

  Future<List<CatFactModel>> getAllCatFacts() async {
    List<CatFactModel> catFacts = [];

    for (var element in catsBox.values) {
      try {
        catFacts.add(CatFactModel.fromHiveDB(element));
      } catch (e) {
        debugPrint(e.toString());
      }
    }

    return catFacts;
  }
}
