import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/cart/data/models/get_cart_response_model.dart';

abstract class CartDataSource {
  Future<void> addToCart({required CartItemRequestModel cartRequestModel});
  Future<void> deleteFromCart({required int productId});
  Future<GetCartResponseModel> getCart();
}
