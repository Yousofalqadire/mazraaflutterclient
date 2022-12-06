
import 'package:dartz/dartz.dart';
import 'package:mazraa/domin/entities/ad_entity.dart';

import '../../data/repositories/rent_repo_impl.dart';
import '../repositories/rent_repository.dart';

class GetRentsUseCases{
  final RentRepository rentRepository = RentRepoImpl();
  Future<Either<String,List<AdEntity>>> getRents()async {
    await Future.delayed(const Duration(seconds: 3));
    return rentRepository.getRents();
  }
}

class GetRentsByAddressUseCases{
  Future<List<AdEntity>> getRentsByAddress(List<AdEntity> rents,String address)async{
    List<AdEntity> tempRents =[];
    if(rents.isNotEmpty){
      for(AdEntity item in rents){
        if(item.address.toLowerCase() == address.toLowerCase()){
          tempRents.add(item);
        }
      }
    }
    if(tempRents.isNotEmpty) {
      await Future.delayed(const Duration(seconds: 2));
      return tempRents;
    }else{
      await Future.delayed(const Duration(seconds: 2));
      return rents;
    }
  }
}
class GetRentsByPriceUseCases{
  Future<List<AdEntity>> getRentsByPrice(List<AdEntity> rents,double start,double end)async{
    List<AdEntity> tempRents =[];
    // convert the start and end to rents range
    //(start * 2000)/100
    //(end * 2000)/100
    start = (start * 2000)/100;
    end = (end * 2000)/100;
    //end
    if(rents.isNotEmpty){
      for(AdEntity item in rents){
        if(item.price.toDouble() >= start && item.price.toDouble() <= end){
          tempRents.add(item);
        }
      }
    }
    if(tempRents.isNotEmpty){
      await Future.delayed(const Duration(seconds: 2));
      return tempRents;
    }else {
      await Future.delayed(const Duration(seconds: 2));
      return rents;
    }
  }
}