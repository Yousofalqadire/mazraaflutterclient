part of 'sell_bloc.dart';

abstract class SellEvent extends Equatable {
  const SellEvent();

  @override
  List<Object> get props => [];
}
class GetSellsEvent extends SellEvent{}
class SearchEvent extends SellEvent{
 final List<AdEntity> sells;
 final String keyWord;

   const SearchEvent({required this.keyWord,required this.sells});
}
class FilterSellsPriceEvent extends SellEvent{
  final double start;
  final double end;
  final List<AdEntity> sells;
  const FilterSellsPriceEvent({required this.start,required this.end,required this.sells});
}
