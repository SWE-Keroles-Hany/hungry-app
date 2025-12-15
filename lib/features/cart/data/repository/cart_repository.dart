import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_list_response_entity.dart';

abstract class CartRepository {
  Future<Either<AppException, void>> addToCart({
    required CartItemRequestModel cartItem,
  });
  Future<Either<AppException, CartListResponseEntity>> getCart();
  Future<Either<AppException, void>> deleteFromCart({required int productId});
}
