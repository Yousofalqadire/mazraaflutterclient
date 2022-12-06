import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domin/entities/ad_entity.dart';
import '../../../../domin/use_cases/get_sells_use_cases.dart';

part 'sell_event.dart';
part 'sell_state.dart';

class SellBloc extends Bloc<SellEvent, SellState> {
  final GetSellsUseCases getSellsUseCases = GetSellsUseCases();
  final SearchSellUseCases searchSellUseCases = SearchSellUseCases();
  final FilterSellsByPriceUseCases filterSellsByPriceUseCases = FilterSellsByPriceUseCases();
  SellBloc() : super(SellInitial()) {
    on<GetSellsEvent>((event, emit)async {
      emit(SellsLoadingState());
      final sellsOrFailure = await getSellsUseCases.getSells();
         sellsOrFailure.fold(
                 (error) => emit(SellErrorState(error: error)),
                 (sells) => emit(SellLoadedState(sells: sells)));

    });
    on<SearchEvent>((event,emit)async {
      emit(SellsLoadingState());
      final List<AdEntity> sells = await searchSellUseCases.onSearchSells(event.sells, event.keyWord,);
       emit(SellLoadedState(sells: sells));
    });
    on<FilterSellsPriceEvent>((event,emit)async{
      emit(SellsLoadingState());
      final List<AdEntity> sells = await filterSellsByPriceUseCases.filterSellsByPrice(event.sells, event.start,event.end);
      emit(SellLoadedState(sells: sells));
    });
  }
}
