import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_item_request_entity.dart';
import 'package:hungry_app/features/order_history/domain/entities/order_entity.dart';

abstract class OrdersRepository {
  Future<Either<AppException, void>> saveOrder({
    required List<CartItemRequestEntity> order,
  });
  Future<Either<AppException, List<OrderEntity>>> getAllOrders();
}
