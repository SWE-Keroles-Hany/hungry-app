import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/home/data/repository/products_repository.dart';
import 'package:hungry_app/features/home/domain/entities/products_entity.dart';

class GetProducts {
  final ProductsRepository _productsRepository;
  GetProducts(this._productsRepository);
  Future<Either<AppException, ProductsEntity>> getProducts({
    String? name,
    int? categoryId,
  }) async {
    return await _productsRepository.getProducts(
      name: name,
      categoryId: categoryId,
    );
  }
}
