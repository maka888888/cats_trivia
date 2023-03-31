import 'package:cat_trivia/models/cat_fact_model.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class CatFactItem extends StatelessWidget {
  final CatFactModel catFact;
  const CatFactItem({Key? key, required this.catFact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(catFact.text),
      subtitle: Text(Jiffy.parseFromDateTime(catFact.updatedAt!).yMMMMEEEEdjm),
    );
  }
}
