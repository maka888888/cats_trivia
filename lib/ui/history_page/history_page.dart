import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/history_cats/history_cats_bloc.dart';
import '../../blocs/history_cats/history_cats_event.dart';
import '../../blocs/history_cats/history_cats_state.dart';
import '../../repositories/local_history_cats_repository.dart';
import 'cat_fact_item.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cats History'),
        ),
        body: BlocProvider(
          create: (BuildContext context) => HistoryCatsBloc(
            historyCatsRepository: LocalHistoryCatsRepository(),
          )..add(HistoryCatsLoadFacts()),
          child: BlocBuilder<HistoryCatsBloc, HistoryCatsState>(
            builder: (BuildContext context, HistoryCatsState state) {
              if (state is HistoryCatsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HistoryCatsLoaded) {
                return ListView.separated(
                    itemCount: state.cats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CatFactItem(
                        catFact: state.cats[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    });
              } else if (state is HistoryCatsLoadError) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                return const Center(
                  child: Text('Error'),
                );
              }
            },
          ),
        ));
  }
}
