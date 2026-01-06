import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_item.dart';
import 'package:hungry_app/features/home/presentation/widgets/tab_item.dart';

dynamic handleResponse(Response response) {
  if (response.statusCode == 200 || response.statusCode == 201) {
    return response.data;
  }
  final message = (response.data is Map) ? response.data["message"] : null;
  throw AppException(message ?? "Something went wrong");
}

OutlineInputBorder getBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(width: 2.5.w, color: AppTheme.white),
    borderRadius: BorderRadius.circular(18.r),
  );
}

Never handleDioError(DioException e) {
  final data = e.response?.data;

  String message = "Something went wrong";

  if (data is Map<String, dynamic>) {
    final serverMessage = data["message"];

    if (serverMessage is String) {
      message = serverMessage;
    } else if (serverMessage is Map) {
      message = serverMessage.values.first.first.toString();
    }
  }

  throw AppException(message);
}

List<ProductItem> getDummyProducts() {
  return [
    ProductItem(
      description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      imgURL:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdpU431xPGZoWC2RW7DAlWe29mnpo2z5m13Q&s",
      rate: "2.2",
      title: "SsssssssssS",
    ),
    ProductItem(
      description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      imgURL:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdpU431xPGZoWC2RW7DAlWe29mnpo2z5m13Q&s",
      rate: "2.2",
      title: "SsssssssssS",
    ),
    ProductItem(
      description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      imgURL:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdpU431xPGZoWC2RW7DAlWe29mnpo2z5m13Q&s",
      rate: "2.2",
      title: "SsssssssssS",
    ),
    ProductItem(
      description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      imgURL:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdpU431xPGZoWC2RW7DAlWe29mnpo2z5m13Q&s",
      rate: "2.2",
      title: "SsssssssssS",
    ),
  ];
}

List<TabItem> getDummyTabs() {
  return [
    TabItem(title: "title", bgColor: Colors.black, titleColor: Colors.black),
    TabItem(title: "title", bgColor: Colors.black, titleColor: Colors.black),
    TabItem(title: "title", bgColor: Colors.black, titleColor: Colors.black),
    TabItem(title: "title", bgColor: Colors.black, titleColor: Colors.black),
    TabItem(title: "title", bgColor: Colors.black, titleColor: Colors.black),
    TabItem(title: "title", bgColor: Colors.black, titleColor: Colors.black),
  ];
}
