
import 'dart:convert';

import 'package:mazraa/domin/entities/ad_entity.dart';
import 'package:http/http.dart'as http;

import '../../constant_values.dart';
abstract class AdsBySellDataSource{
  Future<List<AdEntity>> getSells();
}
class SellsDataSourceImpl implements AdsBySellDataSource{
  final client = http.Client();
  @override
  Future<List<AdEntity>> getSells() async {
    List<AdEntity> sells =[];
    final response = await client.get(
        Uri.parse('${ConstantValues.baseUrl}ads/get-sells')
    );
    final jsonBody = jsonDecode(response.body);
    for(Map ad in jsonBody){
      sells.add(AdEntity.fromJson(ad));
    }
    return sells;
  }

}