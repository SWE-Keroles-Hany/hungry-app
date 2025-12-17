import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_item_request_entity.dart';
import 'package:hungry_app/features/order_history/data/repository/orders_repository.dart';

class SaveOrder {
  final OrdersRepository _ordersRepository;
  SaveOrder(this._ordersRepository);
  Future<Either<AppException, void>> saveOrder({
    required List<CartItemRequestEntity> order,
  }) async {
    return await _ordersRepository.saveOrder(order: order);
  }
}
