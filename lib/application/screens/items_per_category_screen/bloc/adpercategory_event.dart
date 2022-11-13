part of 'adpercategory_bloc.dart';

abstract class AdPerCategoryEvent extends Equatable {
  const AdPerCategoryEvent();

  @override
  List<Object> get props => [];
}
class GetAdsPerCategoryEvent extends AdPerCategoryEvent{
  final String category;
  GetAdsPerCategoryEvent({required this.category});
  @override
  List<Object> get props => [category];
}
