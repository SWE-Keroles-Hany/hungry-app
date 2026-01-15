import 'dart:developer';

import 'package:hungry_app/core/constants/api_constants.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/core/network/dio_service.dart';
import 'package:hungry_app/features/cart/data/data_source/cart_data_source.dart';
import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/cart/data/models/get_cart_response_model.dart';

class CartAPIDataSource implements CartDataSource {
  final DioService dio;
  CartAPIDataSource(this.dio);
  @override
  Future<void> addToCart({
    required CartItemRequestModel cartRequestModel,
  }) async {
    try {
      await dio.post(
        endPoint: APIConstants.addToCart,
        data: {
          'items': [
            {
              "product_id": cartRequestModel.productId,
              "quantity": cartRequestModel.quantity,
              "spicy": cartRequestModel.spicy,
              "toppings": cartRequestModel.toppings,
              "side_options": cartRequestModel.sideOptions,
            },
          ],
        },
      );
    } on AppException catch (exception) {
      log(exception.message);

      throw AppException(exception.message);
    } catch (error) {
      log(error.toString());
      throw AppException("Some Thing Went Wrong");
    }
  }

  @override
  Future<void> deleteFromCart({required int productId}) async {
    try {
      await dio.delete(endPoint: '${APIConstants.removeFromCart}/$productId');
    } on AppException catch (exception) {
      throw AppException(exception.message);
    } catch (_) {
      throw AppException("Some Thing Went Wrong");
    }
  }

  @override
  Future<GetCartResponseModel> getCart() async {
    try {
      final response = await dio.get(endPoint: APIConstants.cart);
      log("=====");
      log(response);
      return GetCartResponseModel.fromJson(response);
    } on AppException catch (exception) {
      throw AppException(exception.message);
    } catch (error) {
      log(error.toString());
      throw AppException("Some Thing Went Wrong");
    }
  }
}
