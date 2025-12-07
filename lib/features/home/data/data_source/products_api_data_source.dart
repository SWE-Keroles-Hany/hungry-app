import 'package:hungry_app/core/constants/api_constants.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/core/network/dio_service.dart';
import 'package:hungry_app/features/home/data/data_source/products_data_source.dart';
import 'package:hungry_app/features/home/data/models/products_model.dart';

class ProductsAPIDataSource implements ProductsDataSource {
  final DioService dio;
  ProductsAPIDataSource(this.dio);
  @override
  Future<ProductsModel> getProductsByCategory({int? categoryId}) async {
    try {
      if (categoryId == null || categoryId == 0) {
        final response = await dio.get(endPoint: APIConstants.products);
        return ProductsModel.fromJson(response);
      } else {
        final response = await dio.get(
          endPoint: APIConstants.products,
          queryParams: {'category_id': categoryId},
        );
        return ProductsModel.fromJson(response);
      }
    } on AppException catch (exception) {
      throw AppException(exception.message);
    }
  }

  //! Search
  @override
  Future<ProductsModel> getProductsByName({String? name}) async {
    try {
      final response = await dio.get(
        endPoint: APIConstants.products,
        queryParams: {'name': name},
      );
      return ProductsModel.fromJson(response);
    } on AppException catch (exception) {
      throw AppException(exception.message);
    }
  }
}
