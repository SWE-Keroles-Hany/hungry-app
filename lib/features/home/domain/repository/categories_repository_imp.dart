import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/home/data/data_source/categories_data_source.dart';
import 'package:hungry_app/features/home/data/mappers/categories_model_mapper.dart';
import 'package:hungry_app/features/home/data/models/category_model.dart';
import 'package:hungry_app/features/home/data/repository/categories_repository.dart';
import 'package:hungry_app/features/home/domain/entities/categories_entity.dart';

class CategoriesRepositoryImp implements CategoriesRepository {
  final CategoriesDataSource _categoriesDataSource;
  CategoriesRepositoryImp(this._categoriesDataSource);

  @override
  Future<Either<AppException, CategoriesEntity>> getAllCategories() async {
    try {
      final result = await _categoriesDataSource.getAllCategories();
      result.categories?.insert(0, CategoryModel(id: 0, name: "All"));
      return Right(result.toEntity);
    } on AppException catch (exception) {
      return Left(AppException(exception.message));
    }
  }
}
