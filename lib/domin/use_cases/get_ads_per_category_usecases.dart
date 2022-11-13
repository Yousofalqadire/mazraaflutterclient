
import 'package:dartz/dartz.dart';
import 'package:mazraa/domin/entities/ad_entity.dart';

import '../../data/repositories/ads_per_category_impl.dart';
import '../repositories/ads_per_category_repository.dart';

class GetAdsPerCategoryUseCases{
final AdsPerCategoryRepository adsPerCategoryRepository = AdsPErCategoryRepoImpl();
  Future<Either<String,List<AdEntity>>> getAdsPerCategory(String category) async{
   await Future.delayed(Duration(seconds: 3),(){});
    return  adsPerCategoryRepository.getAdsPerCategory(category);
  }
}