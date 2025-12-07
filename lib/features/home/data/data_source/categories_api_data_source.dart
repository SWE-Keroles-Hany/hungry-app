import 'package:hungry_app/core/constants/api_constants.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/core/network/dio_service.dart';
import 'package:hungry_app/features/home/data/data_source/categories_data_source.dart';
import 'package:hungry_app/features/home/data/models/categorires_model.dart';

class CategoriesAPIDataSource implements CategoriesDataSource {
  final DioService dio;
  CategoriesAPIDataSource(this.dio);
  @override
  Future<CategoriesModel> getAllCategories() async {
    try {
      final response = await dio.get(endPoint: APIConstants.categories);
      return CategoriesModel.fromJson(response);
    } on AppException catch (exception) {
      throw AppException(exception.message);
    }
  }
}
