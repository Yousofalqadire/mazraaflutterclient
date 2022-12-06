import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domin/entities/ad_entity.dart';
import '../../../../domin/use_cases/get_rents_use_cases.dart';

part 'rent_event.dart';
part 'rent_state.dart';

class RentBloc extends Bloc<RentEvent, RentState> {
  final GetRentsUseCases getRentsUseCases = GetRentsUseCases();
  final GetRentsByAddressUseCases getRentsByAddressUseCases = GetRentsByAddressUseCases();
  final GetRentsByPriceUseCases getRentsByPriceUseCases = GetRentsByPriceUseCases();
  RentBloc() : super(RentInitial()) {
    on<GetRentsEvent>((event, emit) async {
      emit(RentLoadingState());
      final rentsOrFailure = await getRentsUseCases.getRents();
       rentsOrFailure.fold(
               (error) => emit(RentErrorState(error: error)),
               (rents) => emit(RentLoadedState(rents: rents)));
    });
    on<GetRentsByAddress>((event,emit)async{
      emit(RentLoadingState());
      final  List<AdEntity> rents = await getRentsByAddressUseCases.getRentsByAddress(event.rents, event.address);
      emit(RentLoadedState(rents: rents));
    });
    on<GetRentsByPrice>((event,emit)async{
      emit(RentLoadingState());
      final List<AdEntity> rents = await getRentsByPriceUseCases.getRentsByPrice(event.rents, event.start,event.end);
      emit(RentLoadedState(rents: rents));
    });
  }
}
