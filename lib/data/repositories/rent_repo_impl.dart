import 'package:dartz/dartz.dart';

import 'package:mazraa/domin/entities/ad_entity.dart';

import '../../domin/repositories/rent_repository.dart';
import '../data_source/ads_by_rent_data_source.dart';

class RentRepoImpl implements RentRepository{
  final AdsByRentDataSource adsByRentDataSource = RentsDataSourceImpl();
  @override
  Future<Either<String, List<AdEntity>>> getRents()async {
    try{
      final rents = await adsByRentDataSource.getRents();
      return right(rents);
    }catch (e){
      return left('somethings wrong');
    }
  }

}