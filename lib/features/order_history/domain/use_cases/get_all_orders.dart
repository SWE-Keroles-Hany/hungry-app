import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/order_history/data/repository/orders_repository.dart';
import 'package:hungry_app/features/order_history/domain/entities/order_entity.dart';

class GetAllOrders {
  final OrdersRepository _ordersRepository;
  GetAllOrders(this._ordersRepository);
  Future<Either<AppException, List<OrderEntity>>> getAllOrders() async {
    return await _ordersRepository.getAllOrders();
  }
}
