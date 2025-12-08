import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/home/data/repository/products_repository.dart';
import 'package:hungry_app/features/home/domain/entities/product_options_entity.dart';

class GetToppingsProducts {
  final ProductsRepository _productsRepository;
  GetToppingsProducts(this._productsRepository);
  Future<Either<AppException, ProductOptionsEntity>> getToppings() async {
    return await _productsRepository.getToppings();
  }
}
