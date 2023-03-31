import 'package:bloc/bloc.dart';
import 'package:cat_trivia/blocs/rest_cats/bloc/rest_cats_event.dart';
import 'package:cat_trivia/blocs/rest_cats/bloc/rest_cats_state.dart';

import '../../../repositories/local_history_cats_repository.dart';
import '../../../repositories/rest_cats_repository.dart';

class RestCatsBloc extends Bloc<RestCatsEvent, RestCatsState> {
  final RestCatsRepository restCatsRepository;
  final LocalHistoryCatsRepository historyCatsRepository;
  RestCatsBloc(
      {required this.restCatsRepository, required this.historyCatsRepository})
      : super(RestCatsLoading()) {
    on<RestCatsLoadFact>(_onLoadFact);
  }

  void _onLoadFact(RestCatsLoadFact event, Emitter<RestCatsState> emit) async {
    emit(RestCatsLoading());

    try {
      final catFact = await restCatsRepository.getCatFact();
      await historyCatsRepository.addCatFact(catFact);
      emit(RestCatsLoaded(catFact));
    } catch (_) {
      emit(RestCatsLoadError());
    }
  }
}
