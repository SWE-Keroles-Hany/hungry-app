import 'order_model.dart';

class OrdersResponseModel {
  final int code;
  final String message;
  final List<OrderModel> orders;

  OrdersResponseModel({
    required this.code,
    required this.message,
    required this.orders,
  });

  factory OrdersResponseModel.fromJson(Map<String, dynamic> json) {
    return OrdersResponseModel(
      code: json['code'],
      message: json['message'],
      orders: (json['data'] as List)
          .map((e) => OrderModel.fromJson(e))
          .toList(),
    );
  }
}
