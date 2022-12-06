
import 'package:dartz/dartz.dart';

import 'package:mazraa/domin/entities/ad_entity.dart';

import '../../domin/repositories/sell_repository.dart';
import '../data_source/ads_by_sell_data_source.dart';

class SellsRepoImpl implements SellRepository{
  final AdsBySellDataSource adsBySellDataSource = SellsDataSourceImpl();
  @override
  Future<Either<String, List<AdEntity>>> getSells() async {
   try {
     final sells = await  adsBySellDataSource.getSells();
     return right(sells);
   }catch (e){
     return left('somethings wrongs');
   }
  }

}