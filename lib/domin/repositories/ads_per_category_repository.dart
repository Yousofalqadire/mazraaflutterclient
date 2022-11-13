
import 'package:dartz/dartz.dart';
import 'package:mazraa/domin/entities/ad_entity.dart';

abstract class AdsPerCategoryRepository{

  Future<Either<String,List<AdEntity>>> getAdsPerCategory(String category);
}