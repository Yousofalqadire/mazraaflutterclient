

import 'package:dartz/dartz.dart';
import 'package:mazraa/domin/entities/category_entity.dart';
import 'package:mazraa/domin/repositories/category_repository.dart';

import '../../data/repositories/categories_repo_impl.dart';

class CategoriesUseCases{
  final CategoryRepository categoryRepository = CategoriesRepoImpl();
  Future<Either<String,List<CategoryEntity>>> getCategories()async {
    await Future.delayed(const Duration(seconds: 3), () {});
    return categoryRepository.getCategories();
  }
}