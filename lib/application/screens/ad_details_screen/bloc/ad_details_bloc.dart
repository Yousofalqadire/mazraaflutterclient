import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mazraa/domin/entities/ad_details_entity.dart';

import '../../../../domin/use_cases/get_ad_details_usecases.dart';

part 'ad_details_event.dart';
part 'ad_details_state.dart';

class AdDetailsBloc extends Bloc<AdDetailsEvent, AdDetailsState> {
  final GetAdDetailsUseCases getAdDetailsUseCases = GetAdDetailsUseCases();
  AdDetailsBloc() : super(AdDetailsInitial()) {
    on<GetAdDetailsEvent>((event, emit) async{
      emit(AdDetailsLoadingState());
      final detailsOrFailure = await getAdDetailsUseCases.getAdDetails(event.adId);
      detailsOrFailure.fold(
              (error) => emit(AdDetailsErrorsState(error: error)),
              (details) => emit(AdDetailsLoadedState(detailsEntity: details)));
    });
  }
}
