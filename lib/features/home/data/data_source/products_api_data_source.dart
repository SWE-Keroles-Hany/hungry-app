
import 'package:hungry_app/core/constants/api_constants.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/core/network/dio_service.dart';
import 'package:hungry_app/features/home/data/data_source/products_data_source.dart';
import 'package:hungry_app/features/home/data/models/product_options_model.dart';
import 'package:hungry_app/features/home/data/models/products_model.dart';

class ProductsAPIDataSource implements ProductsDataSource {
  final DioService dio;
  ProductsAPIDataSource(this.dio);
  @override
  Future<ProductsModel> getProducts({int? categoryId, String? name}) async {
    try {
      final Map<String, dynamic> params = {};

      if (categoryId != null) {
        params['category_id'] = categoryId;
      }
      if (name != null) {
        params['name'] = name;
      }

      final response = await dio.get(
        endPoint: APIConstants.products,
        queryParams: params.isEmpty ? null : params,
      );
      return ProductsModel.fromJson(response);
    } on AppException catch (exception) {
      throw AppException(exception.message);
    }
  }

  @override
  Future<ProductOptionsModel> getSideOptions() async {
    try {
      final response = await dio.get(endPoint: APIConstants.sideOptions);
      return ProductOptionsModel.fromJson(response);
    } on AppException catch (exception) {
      throw AppException(exception.message);
    } catch (_) {
      throw AppException("Some Thing Went Wrong");
    }
  }

  @override
  Future<ProductOptionsModel> getToppings() async {
    try {
      final response = await dio.get(endPoint: APIConstants.toppings);
      return ProductOptionsModel.fromJson(response);
    } on AppException catch (exception) {
      throw AppException(exception.message);
    } catch (_) {
      throw AppException("Some Thing Went Wrong");
    }
  }
}
