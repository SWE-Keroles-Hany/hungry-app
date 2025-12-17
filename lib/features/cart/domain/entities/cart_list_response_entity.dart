import 'package:hungry_app/features/cart/domain/entities/cart_item_response_entity.dart';

class CartListResponseEntity {
  int? id;
  String? totalPrice;
  List<CartItemResponseEntity>? items;
  CartListResponseEntity({this.id, this.items, this.totalPrice});
}
