import 'package:cat_trivia/ui/history_page/history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/rest_cats/bloc/rest_cats_bloc.dart';
import '../../blocs/rest_cats/bloc/rest_cats_event.dart';
import '../../blocs/rest_cats/bloc/rest_cats_state.dart';
import '../../repositories/local_history_cats_repository.dart';
import '../../repositories/rest_cats_repository.dart';
import 'cat_fact_card.dart';
import 'loading_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats Trivia'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HistoryPage(),
                ),
              );
            },
            icon: const Icon(Icons.history),
          ),
        ],
      ),
      body: BlocProvider(
        create: (BuildContext context) => RestCatsBloc(
            restCatsRepository: RestCatsRepository(),
            historyCatsRepository: LocalHistoryCatsRepository())
          ..add(RestCatsLoadFact()),
        child: BlocBuilder<RestCatsBloc, RestCatsState>(
            builder: (BuildContext context, RestCatsState state) {
          if (state is RestCatsLoading) {
            return const Center(
              child: CatLoadingCard(),
            );
          } else if (state is RestCatsLoaded) {
            return Center(
              child: CatFactCard(
                catFact: state.catFact,
              ),
            );
          } else if (state is RestCatsLoadError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        }),
      ),
    );
  }
}
