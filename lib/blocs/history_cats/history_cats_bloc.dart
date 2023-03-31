import 'package:bloc/bloc.dart';

import '../../repositories/local_history_cats_repository.dart';
import 'history_cats_event.dart';
import 'history_cats_state.dart';

class HistoryCatsBloc extends Bloc<HistoryCatsEvent, HistoryCatsState> {
  final LocalHistoryCatsRepository historyCatsRepository;

  HistoryCatsBloc({required this.historyCatsRepository})
      : super(HistoryCatsLoading()) {
    on<HistoryCatsLoadFacts>(_onLoadHistoryFacts);
  }

  void _onLoadHistoryFacts(
      HistoryCatsLoadFacts event, Emitter<HistoryCatsState> emit) async {
    emit(HistoryCatsLoading());

    try {
      final catFacts = await historyCatsRepository.getAllCatFacts();
      emit(HistoryCatsLoaded(catFacts!));
    } catch (_) {
      emit(HistoryCatsLoadError());
    }
  }
}
