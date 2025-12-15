import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/cart/data/mappers/cart_item_request_entity_mapper.dart';
import 'package:hungry_app/features/cart/data/repository/cart_repository.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_item_request_entity.dart';

class AddToCart {
  final CartRepository _cartRepository;
  AddToCart(this._cartRepository);
  Future<Either<AppException, void>> addToCart({
    required CartItemRequestEntity cartItem,
  }) async {
    return await _cartRepository.addToCart(cartItem: cartItem.toModel);
  }
}
