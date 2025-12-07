import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/home/data/repository/categories_repository.dart';
import 'package:hungry_app/features/home/domain/entities/categories_entity.dart';

class GetAllCategories {
  final CategoriesRepository _categoriesRepository;
  GetAllCategories(this._categoriesRepository);
  Future<Either<AppException, CategoriesEntity>> getAllCategories() async {
    return await _categoriesRepository.getAllCategories();
  }
}
