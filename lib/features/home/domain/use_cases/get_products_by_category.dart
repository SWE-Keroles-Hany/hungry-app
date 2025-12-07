import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/home/data/repository/products_repository.dart';
import 'package:hungry_app/features/home/domain/entities/products_entity.dart';

class GetProductsByCategory {
  final ProductsRepository _productsRepository;
  GetProductsByCategory(this._productsRepository);
  Future<Either<AppException, ProductsEntity>> getProductsByCategory({
    int? categoryId,
  }) async {
    return await _productsRepository.getProductsByCategory(
      categoryId: categoryId,
    );
  }
}
