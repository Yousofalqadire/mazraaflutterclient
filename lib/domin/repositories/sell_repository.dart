
import 'package:dartz/dartz.dart';
import 'package:mazraa/domin/entities/ad_entity.dart';

abstract class SellRepository{
  Future<Either<String,List<AdEntity>>> getSells();
}