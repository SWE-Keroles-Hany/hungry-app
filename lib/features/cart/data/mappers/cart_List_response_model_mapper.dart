import 'package:hungry_app/features/cart/data/mappers/cart_item_response_model_mapper.dart';
import 'package:hungry_app/features/cart/data/models/cart_list_response_model.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_list_response_entity.dart';

extension CartListResponseModelMapper on CartListResponseModel {
  CartListResponseEntity get toEntity => CartListResponseEntity(
    items: items?.map((item) => item.toEntity).toList(),
    totalPrice: totalPrice,
    id: id,
  );
}
