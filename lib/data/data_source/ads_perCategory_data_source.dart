
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:mazraa/constant_values.dart';
import 'package:mazraa/domin/entities/ad_entity.dart';
abstract class AdsPErCategoryDataSource{
  Future<List<AdEntity>> getAdsPerCategory(String category);
}

class AdsPerCategoryDatSourceImpl implements AdsPErCategoryDataSource{
  final client = http.Client();
  @override
  Future<List<AdEntity>> getAdsPerCategory(String category) async {
    List<AdEntity> ads =[];
   final response = await client.get(
     Uri.parse('${ConstantValues.baseUrl}ads/get-by-category/$category')
   );
   final jsonBody = jsonDecode(response.body);
   for(Map ad in jsonBody){
     ads.add(AdEntity.fromJson(ad));
   }
   return ads;
  }
  
}