import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hungry_app/core/constants/api_constants.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/core/helper/app_helper.dart';
import 'package:hungry_app/core/network/api_service.dart';
import 'package:hungry_app/core/network/dio_interceptors.dart';

class DioService implements APIService {
  final Dio dio;
  DioService(this.dio) {
    dio.options.baseUrl = APIConstants.baseURL;
    dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    dio.interceptors.add(DioInterceptors());
  }

  @override
  Future<dynamic> delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.delete(
        endPoint,
        data: data,
        queryParameters: queryParams,
      );
      return handleResponse(response);
    } on DioException catch (exception) {
      return handleDioError(exception);
    } catch (_) {
      throw AppException("Some Thing Went Wrong");
    }
  }

  @override
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.get(endPoint, queryParameters: queryParams);
      return handleResponse(response);
    } on DioException catch (exception) {
      return handleDioError(exception);
    } catch (_) {
      throw AppException("Some Thing Went Wrong");
    }
  }

  @override
  Future<dynamic> post({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParams,
    Options? options,
  }) async {
    try {
      final response = await dio.post(
        options: options,
        endPoint,
        data: data,
        queryParameters: queryParams,
      );
      log(response.toString());
      return handleResponse(response);
    } on DioException catch (exception) {
      log("Exp : ${exception.response!.data}");
      log("ExpRes : ${exception.response}");

      return handleDioError(exception);
    } catch (error) {
      log("here in dio${error.toString()}");

      throw AppException("Some Thing Went Wrong");
    }
  }

  @override
  Future<dynamic> put({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.put(
        endPoint,
        data: data,
        queryParameters: queryParams,
      );
      return handleResponse(response);
    } on DioException catch (exception) {
      return handleDioError(exception);
    } catch (_) {
      throw AppException("Some Thing Went Wrong");
    }
  }
}
