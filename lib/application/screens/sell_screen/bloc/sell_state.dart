part of 'sell_bloc.dart';

abstract class SellState extends Equatable {
  const SellState();
  
  @override
  List<Object> get props => [];
}

class SellInitial extends SellState {}
class SellsLoadingState extends SellState{}
class SellLoadedState extends SellState{
  final List<AdEntity> sells;
 const  SellLoadedState({required this.sells});
  @override
  List<Object> get props => [sells];
}
class SellErrorState extends SellState{
  final String error;
 const SellErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
