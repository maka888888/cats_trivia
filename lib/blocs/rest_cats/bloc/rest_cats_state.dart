import 'package:cat_trivia/models/cat_fact_model.dart';
import 'package:equatable/equatable.dart';

abstract class RestCatsState extends Equatable {
  const RestCatsState();

  @override
  List<Object> get props => [];
}

class RestCatsLoading extends RestCatsState {}

class RestCatsLoaded extends RestCatsState {
  final CatFactModel catFact;
  const RestCatsLoaded(this.catFact);

  @override
  List<Object> get props => [catFact];
}

class RestCatsLoadError extends RestCatsState {}
