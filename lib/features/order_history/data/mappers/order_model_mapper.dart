import 'package:hungry_app/features/order_history/data/models/order_model.dart';
import 'package:hungry_app/features/order_history/domain/entities/order_entity.dart';

extension OrderModelMapper on OrderModel {
  OrderEntity get toEntity => OrderEntity(
    createdAt: createdAt,
    id: id,
    productImage: productImage,
    status: status,
    totalPrice: totalPrice,
  );
}
