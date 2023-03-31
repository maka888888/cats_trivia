import 'package:equatable/equatable.dart';

abstract class RestCatsEvent extends Equatable {
  const RestCatsEvent();

  @override
  List<Object> get props => [];
}

class RestCatsLoadFact extends RestCatsEvent {}
