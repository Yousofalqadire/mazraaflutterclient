
import 'package:dartz/dartz.dart';
import 'package:mazraa/domin/entities/ad_details_entity.dart';

import '../../data/repositories/ad_details_repo_impl.dart';
import '../repositories/ad_details_repository.dart';

class GetAdDetailsUseCases{
final AdDetailsRepository adDetailsRepository = AdDetailsRepoImpl();
  Future<Either<String,AdDetailsEntity>> getAdDetails(int id)async{
   await Future.delayed(const Duration(seconds: 3));
    return await adDetailsRepository.getAdDetails(id);
  }
}