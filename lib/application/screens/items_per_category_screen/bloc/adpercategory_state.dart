part of 'adpercategory_bloc.dart';

abstract class AdPerCategoryState extends Equatable {
  const AdPerCategoryState();
  
  @override
  List<Object> get props => [];
}

class AdPercCategoryInitial extends AdPerCategoryState {

}
class AdsPerCategoryLoadingState extends AdPerCategoryState{}
class AdsPerCategoryErrorState extends AdPerCategoryState{
  final String error;
  AdsPerCategoryErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
class AdsPerCategoryLoadedState extends AdPerCategoryState{
  final List<AdEntity> ads;
  AdsPerCategoryLoadedState({required this.ads});
  @override
  List<Object> get props => [ads];
}