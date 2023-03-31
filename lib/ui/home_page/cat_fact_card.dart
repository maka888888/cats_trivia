import 'package:cat_trivia/models/cat_fact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';

import '../../blocs/rest_cats/bloc/rest_cats_bloc.dart';
import '../../blocs/rest_cats/bloc/rest_cats_event.dart';

class CatFactCard extends StatelessWidget {
  final CatFactModel catFact;
  const CatFactCard({Key? key, required this.catFact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 400,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.network(
                  'https://cataas.com/cat' +
                      '?r=' +
                      DateTime.now().millisecondsSinceEpoch.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: RichText(
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: catFact.text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              subtitle:
                  Text(Jiffy.parseFromDateTime(catFact.updatedAt).yMMMMEEEEdjm),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    context.read<RestCatsBloc>().add(RestCatsLoadFact());
                  },
                  child: const Text('Next cat fact'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
