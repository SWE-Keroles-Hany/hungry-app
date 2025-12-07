import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/home/data/data_source/categories_data_source.dart';
import 'package:hungry_app/features/home/data/data_source/products_data_source.dart';
import 'package:hungry_app/features/home/data/mappers/categories_model_mapper.dart';
import 'package:hungry_app/features/home/data/mappers/products_model_mapper.dart';
import 'package:hungry_app/features/home/data/repository/products_repository.dart';
import 'package:hungry_app/features/home/domain/entities/categories_entity.dart';
import 'package:hungry_app/features/home/domain/entities/products_entity.dart';

class ProductsRepositoryImp implements ProductsRepository {
  final ProductsDataSource _productsDataSource;
  final CategoriesDataSource _categoriesDataSource;
  ProductsRepositoryImp(this._categoriesDataSource, this._productsDataSource);
  @override
  Future<Either<AppException, ProductsEntity>> getProductsByCategory({
    int? categoryId,
  }) async {
    try {
      final result = await _productsDataSource.getProductsByCategory(
        categoryId: categoryId,
      );
      return Right(result.toEntity);
    } on AppException catch (exception) {
      return Left(AppException(exception.message));
    }
  }

  @override
  Future<Either<AppException, ProductsEntity>> getProductsByName({
    required String name,
  }) async {
    try {
      final result = await _productsDataSource.getProductsByName(name: name);
      return Right(result.toEntity);
    } on AppException catch (exception) {
      return Left(AppException(exception.message));
    }
  }

  @override
  Future<Either<AppException, CategoriesEntity>> getAllCategories() async {
    try {
      final result = await _categoriesDataSource.getAllCategories();
      return Right(result.toEntity);
    } on AppException catch (exception) {
      return Left(AppException(exception.message));
    }
  }
}
