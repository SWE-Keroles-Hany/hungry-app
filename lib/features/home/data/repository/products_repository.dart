import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/home/domain/entities/products_entity.dart';

abstract class ProductsRepository {
  Future<Either<AppException, ProductsEntity>> getProductsByName({
    required String name,
  });
  Future<Either<AppException, ProductsEntity>> getProductsByCategory({
    int? categoryId,
  });
}
