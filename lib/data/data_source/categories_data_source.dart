
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mazraa/constant_values.dart';
import 'package:mazraa/domin/entities/category_entity.dart';
import 'package:http/http.dart' as http;
abstract class CategoriesDataSource {
  Future<List<CategoryEntity>> getCategoriesFromDataSource();
}
class CategoriesDataImpl implements CategoriesDataSource {
  final client = http.Client();
  @override
  Future<List<CategoryEntity>> getCategoriesFromDataSource()async{
    List<CategoryEntity> categories = [];
    final response = await client.get(
      Uri.parse('${ConstantValues.baseUrl}category'),

    );
      var jsonBody = jsonDecode(response.body);
      for(Map category in jsonBody){
      var c =  CategoryEntity(categoryID:category['categoryID'], categoryName: category['categoryName']) ;
      categories.add(c);
      }
      return categories;

  }

}