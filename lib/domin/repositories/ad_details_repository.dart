
import 'package:dartz/dartz.dart';
import 'package:mazraa/domin/entities/ad_details_entity.dart';

 abstract class AdDetailsRepository{

  Future<Either<String,AdDetailsEntity>> getAdDetails(int id);
}