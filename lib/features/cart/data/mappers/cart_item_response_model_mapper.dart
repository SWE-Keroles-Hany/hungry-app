import 'package:hungry_app/features/cart/data/models/cart_item_response_model.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_item_response_entity.dart';
import 'package:hungry_app/features/home/data/mappers/product_option_mapper.dart';

extension CartItemResponseModelMapper on CartItemResponseModel {
  CartItemResponseEntity get toEntity => CartItemResponseEntity(
    image: image,
    name: name,
    price: price,
    itemId: itemId,
    spicy: spicy,
    productId: productId,
    quantity: quantity,
    sideOptions: sideOptions?.map((item) => item.toEntity).toList(),
  );
}
