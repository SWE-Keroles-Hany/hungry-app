import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/features/cart/data/mappers/cart_item_request_entity_mapper.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_item_request_entity.dart';
import 'package:hungry_app/features/order_history/data/data_source/orders_data_source.dart';
import 'package:hungry_app/features/order_history/data/mappers/order_model_mapper.dart';
import 'package:hungry_app/features/order_history/data/repository/orders_repository.dart';
import 'package:hungry_app/features/order_history/domain/entities/order_entity.dart';

class OrdersRepositoryImp implements OrdersRepository {
  final OrdersDataSource _ordersDataSource;
  OrdersRepositoryImp(this._ordersDataSource);
  @override
  Future<Either<AppException, List<OrderEntity>>> getAllOrders() async {
    try {
      final result = await _ordersDataSource.getAllOrders();
      final orders = result.orders.map((item) => item.toEntity).toList();
      return Right(orders);
    } on AppException catch (exception) {
      return Left(AppException(exception.message));
    } catch (exception) {
      return Left(AppException("Some Thing Went Wrong"));
    }
  }

  @override
  Future<Either<AppException, void>> saveOrder({
    required List<CartItemRequestEntity> order,
  }) async {
    try {
      final orderModel = order.map((item) => item.toModel).toList();
      await _ordersDataSource.saveOrder(order: orderModel);
      return Right(null);
    } on AppException catch (exception) {
      return Left(AppException(exception.message));
    } catch (exception) {
      return Left(AppException("Some Thing Went Wrong"));
    }
  }
}
