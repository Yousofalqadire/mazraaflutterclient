
import 'package:dartz/dartz.dart';

import 'package:mazraa/domin/entities/ad_details_entity.dart';

import '../../domin/repositories/ad_details_repository.dart';
import '../data_source/ad_details_data_source.dart';

class AdDetailsRepoImpl implements AdDetailsRepository{
  final AdDetailsDataSource adDetailsDataSource= AdDetailsDataSourceImpl();
  @override
  Future<Either<String, AdDetailsEntity>> getAdDetails(int id)async {
    try{
      final adDetails = await adDetailsDataSource.getAdDetails(id);
      return right(adDetails);

    }catch(e){
      return left('somethings wrong');
    }
  }
}