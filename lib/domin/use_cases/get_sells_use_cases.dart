

import 'package:dartz/dartz.dart';
import 'package:mazraa/domin/entities/ad_entity.dart';

import '../../data/repositories/sells_repo_impl.dart';
import '../repositories/sell_repository.dart';

class GetSellsUseCases{
  final SellRepository sellRepository = SellsRepoImpl();
  Future<Either<String,List<AdEntity>>> getSells()async{
    await Future.delayed(const Duration(seconds: 3));
    return sellRepository.getSells();
  }
}
class SearchSellUseCases{
 Future<List<AdEntity>> onSearchSells(List<AdEntity> sells, String? keyWord)async{
   List<AdEntity> result =[];
   if(sells.isNotEmpty){
   for(AdEntity item in sells) {
    if(item.address.toLowerCase() == keyWord!.toLowerCase()){
      result.add(item);
      await Future.delayed(const Duration(seconds: 1));
      return result;
    }

   }

   }
   await Future.delayed(const Duration(seconds: 1));
   return sells;
 }
}
class FilterSellsByPriceUseCases {
  Future<List<AdEntity>> filterSellsByPrice(List<AdEntity> sells, double start,double end) async{
    List<AdEntity> result =[];
    // convert the start and end to prices range
     start = (100.000/100*start);
     end = (100.000/100*end);
    if(sells.isNotEmpty){
      for(AdEntity item in sells){
        if(item.price.toDouble() >= start && item.price.toDouble() <= end){
          result.add(item);
        }
      }
      await Future.delayed(const Duration(seconds: 2));
      return result;
    }
    await Future.delayed(const Duration(seconds: 2));
    return sells;
  }
}