import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/home/data/repository/products_repository.dart';
import 'package:hungry_app/features/home/domain/entities/products_entity.dart';

class GetProductsByName {
  final ProductsRepository _productsRepository;
  GetProductsByName(this._productsRepository);
  Future<Either<AppException, ProductsEntity>> getProductsByName({
    required String name,
  }) async {
    return await _productsRepository.getProductsByName(name: name);
  }
}
