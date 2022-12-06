part of 'rent_bloc.dart';

abstract class RentState extends Equatable {
  const RentState();
  
  @override
  List<Object> get props => [];
}

class RentInitial extends RentState {}
class RentLoadingState extends RentState{}
class RentLoadedState extends RentState{
   List<AdEntity> rents;
   RentLoadedState({required this.rents});
  @override
  List<Object> get props => [rents];
}
class RentErrorState extends RentState{
  final String error;
  const RentErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
