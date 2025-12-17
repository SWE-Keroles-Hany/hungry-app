import 'package:hungry_app/features/order_history/domain/entities/order_entity.dart';

abstract class OrdersStates {}

class IntailOrdersState implements OrdersStates {}

//! save order
class ErrorSaveOrdersState implements OrdersStates {
  final String message;
  ErrorSaveOrdersState(this.message);
}

class LoadingSaveOrdersState implements OrdersStates {}

class SuccessSaveOrdersState implements OrdersStates {}

//! get all orders
class ErrorGetAllOrdersState implements OrdersStates {
  final String message;
  ErrorGetAllOrdersState(this.message);
}

class LoadingGetAllOrdersState implements OrdersStates {}

class SuccessGetAllOrdersState implements OrdersStates {
  final List<OrderEntity> order;
  SuccessGetAllOrdersState({required this.order});
}
