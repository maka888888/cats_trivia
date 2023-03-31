import 'package:bloc/bloc.dart';
import 'package:cat_trivia/blocs/rest_cats/bloc/rest_cats_event.dart';
import 'package:cat_trivia/blocs/rest_cats/bloc/rest_cats_state.dart';

import '../../../repositories/rest_cats_repository.dart';

class RestCatsBloc extends Bloc<RestCatsEvent, RestCatsState> {
  final RestCatsRepository restCatsRepository;
  RestCatsBloc({required this.restCatsRepository}) : super(RestCatsLoading()) {
    on<RestCatsLoadFact>(_onLoadFact);
  }

  void _onLoadFact(RestCatsLoadFact event, Emitter<RestCatsState> emit) async {
    emit(RestCatsLoading());
    try {
      final catFact = await restCatsRepository.getCatFact();
      emit(RestCatsLoaded(catFact));
    } catch (_) {
      emit(RestCatsLoadError());
    }
  }
}
