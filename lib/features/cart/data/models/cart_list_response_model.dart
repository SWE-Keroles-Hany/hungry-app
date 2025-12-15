import 'package:hungry_app/features/cart/data/models/cart_item_response_model.dart';

class CartListResponseModel {
  int? id;
  String? totalPrice;
  List<CartItemResponseModel>? items;

  CartListResponseModel({this.id, this.totalPrice, this.items});

  CartListResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalPrice = json['total_price'];
    if (json['items'] != null) {
      items = <CartItemResponseModel>[];
      json['items'].forEach((v) {
        items!.add(CartItemResponseModel.fromJson(v));
      });
    }
  }
}
