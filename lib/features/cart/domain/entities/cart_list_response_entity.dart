import 'package:hungry_app/features/cart/domain/entities/cart_item_response_entity.dart';

class CartListResponseEntity {
  String? totalPrice;
  List<CartItemResponseEntity>? items;
  CartListResponseEntity({this.items, this.totalPrice});
}
