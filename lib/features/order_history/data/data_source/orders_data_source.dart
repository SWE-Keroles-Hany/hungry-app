import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/order_history/data/models/order_response_model.dart';

abstract class OrdersDataSource {
  Future<void> saveOrder({required List<CartItemRequestModel> order});
  Future<OrdersResponseModel> getAllOrders();
}
