
import 'package:dartz/dartz.dart';
import 'package:mazraa/domin/entities/ad_entity.dart';
import 'package:mazraa/domin/repositories/ads_per_category_repository.dart';

import '../data_source/ads_perCategory_data_source.dart';

class AdsPErCategoryRepoImpl implements AdsPerCategoryRepository{
  final AdsPErCategoryDataSource adsPErCategoryDataSource = AdsPerCategoryDatSourceImpl();
  @override
  Future<Either<String, List<AdEntity>>> getAdsPerCategory(String category)async {
    try{
      final ads = await adsPErCategoryDataSource.getAdsPerCategory(category);
      return right(ads);
    }catch (e){
      return left('sothing gonna wrong');
    }
  }

}