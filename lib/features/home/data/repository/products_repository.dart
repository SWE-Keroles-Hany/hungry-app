import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/home/domain/entities/categories_entity.dart';
import 'package:hungry_app/features/home/domain/entities/products_entity.dart';

abstract class ProductsRepository {
  Future<Either<AppException, CategoriesEntity>> getAllCategories();
  Future<Either<AppException, ProductsEntity>> getProducts({
    String? name,
    int? categoryId,
  });
}
