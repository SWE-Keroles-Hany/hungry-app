import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/cart/data/repository/cart_repository.dart';

class DeleteFromCart {
  final CartRepository _cartRepository;
  DeleteFromCart(this._cartRepository);
  Future<Either<AppException, void>> deleteFromCart({
    required int productId,
  }) async {
    return await _cartRepository.deleteFromCart(productId: productId);
  }
}
