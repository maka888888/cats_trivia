import 'package:equatable/equatable.dart';

abstract class HistoryCatsEvent extends Equatable {
  const HistoryCatsEvent();

  @override
  List<Object> get props => [];
}

class HistoryCatsLoadFacts extends HistoryCatsEvent {}
