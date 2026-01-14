import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/cart/data/data_source/cart_api_data_source.dart';
import 'package:hungry_app/features/cart/data/mappers/cart_List_response_model_mapper.dart';
import 'package:hungry_app/features/cart/data/mappers/cart_item_response_model_mapper.dart';
import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/cart/data/repository/cart_repository.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_list_response_entity.dart';

class CartRepositoryImp implements CartRepository {
  final CartAPIDataSource _cartAPIDataSource;
  CartRepositoryImp(this._cartAPIDataSource);
  @override
  Future<Either<AppException, void>> addToCart({
    required CartItemRequestModel cartItem,
  }) async {
    try {
      await _cartAPIDataSource.addToCart(cartRequestModel: cartItem);
      return Right(null);
    } on AppException catch (exception) {
      log(exception.message);

      return left(AppException(exception.message));
    } catch (_) {
      return left(AppException("Some Thing Went Wrong"));
    }
  }

  @override
  Future<Either<AppException, void>> deleteFromCart({
    required int productId,
  }) async {
    try {
      await _cartAPIDataSource.deleteFromCart(productId: productId);
      return Right(null);
    } on AppException catch (exception) {
      log(exception.message);

      return left(AppException(exception.message));
    } catch (_) {
      return left(AppException("Some Thing Went Wrong"));
    }
  }

  @override
  Future<Either<AppException, CartListResponseEntity>> getCart() async {
    try {
      final response = await _cartAPIDataSource.getCart();
      if (response.message == "Attempt to read property on null") {
        return Right(CartListResponseEntity(items: [], totalPrice: '0'));
      }
      return Right(
        response.cartList?.toEntity ??
            CartListResponseEntity(items: [], totalPrice: '0'),
      );
    } on AppException catch (exception) {
      log(exception.message);

      return left(AppException(exception.message));
    } catch (_) {
      return left(AppException("Some Thing Went Wrong"));
    }
  }
}
