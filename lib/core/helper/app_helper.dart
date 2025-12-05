import 'package:dio/dio.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';

dynamic handleResponse(Response response) {
  if (response.statusCode == 200 || response.statusCode == 201) {
    return response.data;
  }
  final message = (response.data is Map) ? response.data["message"] : null;
  throw AppException(message ?? "Something went wrong");
}

Never handleDioError(DioException e) {
  final message = (e.response?.data is Map)
      ? e.response?.data["message"]
      : null;

  throw AppException(message ?? "Something went wrong");
}
