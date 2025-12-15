import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/cart/data/repository/cart_repository.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_list_response_entity.dart';

class GetCart {
  final CartRepository _cartRepository;
  GetCart(this._cartRepository);
  Future<Either<AppException, CartListResponseEntity>> getCart() async {
    return await _cartRepository.getCart();
  }
}
