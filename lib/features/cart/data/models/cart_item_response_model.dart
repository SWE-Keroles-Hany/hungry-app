import 'package:hungry_app/features/home/data/models/product_option.dart';

class CartItemResponseModel {
  int? itemId;
  int? productId;
  String? name;
  String? image;
  int? quantity;
  String? price;
  String? spicy;
  List<ProductOptionModel>? toppings;
  List<ProductOptionModel>? sideOptions;

  CartItemResponseModel({
    this.itemId,
    this.productId,
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.spicy,
    this.toppings,
    this.sideOptions,
  });

  CartItemResponseModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    productId = json['product_id'];
    name = json['name'];
    image = json['image'];
    quantity = json['quantity'];
    price = json['price'];
    spicy = json['spicy']?.toString();
    if (json['toppings'] != null) {
      toppings = <ProductOptionModel>[];
      json['toppings'].forEach((v) {
        toppings!.add(ProductOptionModel.fromJson(v));
      });
    }
    if (json['side_options'] != null) {
      sideOptions = <ProductOptionModel>[];
      json['side_options'].forEach((v) {
        sideOptions!.add(ProductOptionModel.fromJson(v));
      });
    }
  }
}
