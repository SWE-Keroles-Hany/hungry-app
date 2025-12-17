import 'package:hungry_app/core/constants/api_constants.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/core/network/dio_service.dart';
import 'package:hungry_app/features/cart/data/models/cart_request_model.dart';
import 'package:hungry_app/features/order_history/data/data_source/orders_data_source.dart';
import 'package:hungry_app/features/order_history/data/models/order_response_model.dart';

class OrdersAPIDataSource implements OrdersDataSource {
  final DioService dio;
  OrdersAPIDataSource(this.dio);
  @override
  Future<OrdersResponseModel> getAllOrders() async {
    try {
      final response = await dio.get(endPoint: APIConstants.orders);
      return OrdersResponseModel.fromJson(response);
    } on AppException catch (exception) {
      throw AppException(exception.message);
    } catch (_) {
      throw AppException("Some Thing Went Wrong");
    }
  }

  @override
  Future<void> saveOrder({required List<CartItemRequestModel> order}) async {
    try {
      await dio.post(
        data: {"items": order.map((item) => item.toJson()).toList()},
        endPoint: APIConstants.orders,
      );
    } on AppException catch (exception) {
      throw AppException(exception.message);
    } catch (_) {
      throw AppException("Some Thing Went Wrong");
    }
  }
}
