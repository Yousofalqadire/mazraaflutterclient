

import 'package:dartz/dartz.dart';
import 'package:mazraa/domin/entities/ad_entity.dart';

abstract class RentRepository{
  Future<Either<String,List<AdEntity>>> getRents();
}