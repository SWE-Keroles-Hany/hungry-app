import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_item_request_entity.dart';

extension CartItemRequestEntityMapper on CartItemRequestEntity {
  CartItemRequestModel get toModel =>
      CartItemRequestModel(productId, quantity, sideOptions, spicy, toppings);
}
