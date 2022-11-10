
import 'package:dartz/dartz.dart';
import 'package:mazraa/domin/entities/category_entity.dart';
import 'package:mazraa/domin/repositories/category_repository.dart';

import '../data_source/categories_data_source.dart';

class CategoriesRepoImpl implements CategoryRepository{
 final CategoriesDataSource categoriesDataSource = CategoriesDataImpl();
  @override
  Future<Either<String, List<CategoryEntity>>> getCategories() async {
    try{
      final categories = await categoriesDataSource.getCategoriesFromDataSource();

       return right(categories);
    }catch(e){
      return left('somethings wrongs');
    }
  }

}