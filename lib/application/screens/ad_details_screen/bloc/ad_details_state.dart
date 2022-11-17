part of 'ad_details_bloc.dart';

abstract class AdDetailsState extends Equatable {
  const AdDetailsState();
  
  @override
  List<Object> get props => [];
}

class AdDetailsInitial extends AdDetailsState {}
class AdDetailsLoadingState extends AdDetailsState{}
class AdDetailsLoadedState extends AdDetailsState{
  final AdDetailsEntity detailsEntity;
  const AdDetailsLoadedState({required this.detailsEntity});
  @override
  List<Object> get props => [detailsEntity];
}
class AdDetailsErrorsState extends AdDetailsState{
  final String error;
  const AdDetailsErrorsState({required this.error});
}
