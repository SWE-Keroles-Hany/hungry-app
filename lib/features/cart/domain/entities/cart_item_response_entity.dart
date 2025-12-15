import 'package:hungry_app/features/home/domain/entities/product_option_entity.dart';

class CartItemResponseEntity {
  int? productId;
  int? itemId;
  String? name;
  String? image;
  int? quantity;
  String? price;
  String? spicy;
  List<ProductOptionEntity>? toppings;
  List<ProductOptionEntity>? sideOptions;

  CartItemResponseEntity({
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
}
