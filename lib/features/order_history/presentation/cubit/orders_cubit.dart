import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_item_request_entity.dart';
import 'package:hungry_app/features/order_history/domain/use_cases/get_all_orders.dart';
import 'package:hungry_app/features/order_history/domain/use_cases/save_order.dart';
import 'package:hungry_app/features/order_history/presentation/cubit/orders_states.dart';

class OrdersCubit extends Cubit<OrdersStates> {
  final SaveOrder _saveOrder;
  final GetAllOrders _getAllOrders;
  OrdersCubit(this._getAllOrders, this._saveOrder) : super(IntailOrdersState());

  Future<void> saveOrder({required List<CartItemRequestEntity> order}) async {
    emit(LoadingSaveOrdersState());
    final response = await _saveOrder.saveOrder(order: order);
    response.fold(
      (excpetion) {
        emit(ErrorSaveOrdersState(excpetion.message));
      },
      (_) {
        emit(SuccessSaveOrdersState());
      },
    );
  }

  Future<void> getAllOrders() async {
    emit(LoadingGetAllOrdersState());
    final response = await _getAllOrders.getAllOrders();
    response.fold(
      (excpetion) {
        emit(ErrorGetAllOrdersState(excpetion.message));
      },
      (order) {
        emit(SuccessGetAllOrdersState(order: order));
      },
    );
  }
}
