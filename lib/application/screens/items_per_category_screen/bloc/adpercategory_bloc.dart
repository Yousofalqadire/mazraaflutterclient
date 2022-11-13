import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domin/entities/ad_entity.dart';
import '../../../../domin/use_cases/get_ads_per_category_usecases.dart';

part 'adpercategory_event.dart';
part 'adpercategory_state.dart';

class AdPerCategoryBloc extends Bloc<AdPerCategoryEvent, AdPerCategoryState> {
  final GetAdsPerCategoryUseCases getAdsPerCategoryUseCases = GetAdsPerCategoryUseCases();
  AdPerCategoryBloc() : super(AdPercCategoryInitial()) {
    on<GetAdsPerCategoryEvent>((event, emit)async {
      emit (AdsPerCategoryLoadingState());
      final failureOrAds = await getAdsPerCategoryUseCases.getAdsPerCategory(event.category);
      failureOrAds.fold(
              (error) => emit(AdsPerCategoryErrorState(error: error)),
              (ads) => emit(AdsPerCategoryLoadedState(ads: ads)));
    });
  }
}
