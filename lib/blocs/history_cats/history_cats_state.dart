import 'package:cat_trivia/models/cat_fact_model.dart';
import 'package:equatable/equatable.dart';

abstract class HistoryCatsState extends Equatable {
  const HistoryCatsState();

  @override
  List<Object> get props => [];
}

class HistoryCatsLoading extends HistoryCatsState {}

class HistoryCatsLoaded extends HistoryCatsState {
  final List<CatFactModel> cats;
  const HistoryCatsLoaded(this.cats);

  @override
  List<Object> get props => [cats];
}

class HistoryCatsLoadError extends HistoryCatsState {}
