
import 'dart:convert';

import 'package:mazraa/constant_values.dart';

import '../../domin/entities/ad_details_entity.dart';
import 'package:http/http.dart'as http;

import '../../domin/entities/photo_entity.dart';
abstract class AdDetailsDataSource{
  Future<AdDetailsEntity> getAdDetails(int id);
}
class AdDetailsDataSourceImpl implements AdDetailsDataSource{
  //TODO
  final client = http.Client();
  @override
  Future<AdDetailsEntity> getAdDetails(int id) async {
    List<AdImage> adImages = [];
    AdDetailsEntity adDetailsEntity;

    final response = await client.get(
      Uri.parse('${ConstantValues.baseUrl}ads/get-ad-details/$id'),
    );
    final jsonBody = jsonDecode(response.body);
      for(Map image in jsonBody['images']){
        adImages.add(AdImage.fromJson(image));
      }
      adDetailsEntity = AdDetailsEntity.fromJson(jsonBody);
      adDetailsEntity.images = adImages;
     return adDetailsEntity;

  }


}