import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/constants/app_constants.dart';
import 'package:hungry_app/core/error/app_exceptions.dart';
import 'package:hungry_app/core/theme/app_theme.dart';
import 'package:hungry_app/features/cart/presentation/widgets/cart_item.dart';
import 'package:hungry_app/features/home/presentation/widgets/product_item.dart';
import 'package:hungry_app/features/home/presentation/widgets/side_option_item.dart';
import 'package:hungry_app/features/home/presentation/widgets/tab_item.dart';
import 'package:hungry_app/features/order_history/presentation/widgets/order_history_item.dart';
import 'package:hungry_app/features/profile/presentation/widgets/profile_picture.dart';
import 'package:hungry_app/features/profile/presentation/widgets/profile_row_info.dart';

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

List<ProductItem> GetDummyProducts() {
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

List<TabItem> GetDummyTabs() {
  return [
    TabItem(title: "title", bgColor: Colors.black, titleColor: Colors.black),
    TabItem(title: "title", bgColor: Colors.black, titleColor: Colors.black),
    TabItem(title: "title", bgColor: Colors.black, titleColor: Colors.black),
    TabItem(title: "title", bgColor: Colors.black, titleColor: Colors.black),
    TabItem(title: "title", bgColor: Colors.black, titleColor: Colors.black),
    TabItem(title: "title", bgColor: Colors.black, titleColor: Colors.black),
  ];
}

List<Widget> GetSideOptions() {
  return [
    SideOptionItem(
      addIcon: "assets/icons/green_add_icon.png",
      imgURL: AppConstants.image,
      name: "aaaa",
    ),
    SizedBox(width: 15.w),
    SideOptionItem(
      addIcon: "assets/icons/green_add_icon.png",
      imgURL: AppConstants.image,
      name: "aaaa",
    ),
    SizedBox(width: 15.w),
    SideOptionItem(
      addIcon: "assets/icons/green_add_icon.png",
      imgURL: AppConstants.image,
      name: "aaaa",
    ),
  ];
}

List<CartItem> GetCartItms() {
  return [
    CartItem(
      price: '',
      onRemove: () {},
      name: '',
      imgURL: AppConstants.image,
      quntity: 0,
    ),
    CartItem(
      price: '',
      onRemove: () {},
      name: '',
      imgURL: AppConstants.image,
      quntity: 0,
    ),
    CartItem(
      price: '',
      onRemove: () {},
      name: '',
      imgURL: AppConstants.image,
      quntity: 0,
    ),
    CartItem(
      price: '',
      onRemove: () {},
      name: '',
      imgURL: AppConstants.image,
      quntity: 0,
    ),
  ];
}

List<Widget> GetProfileInfo() {
  return [
    // SizedBox(height: 150.h),
    ProfilePicture(file: null),
    SizedBox(height: 30.h),
    ProfileRowInfo(label: "label", value: "value"),
    SizedBox(height: 30.h),

    ProfileRowInfo(label: "label", value: "value"),
    SizedBox(height: 30.h),

    ProfileRowInfo(label: "label", value: "value"),
    SizedBox(height: 30.h),
  ];
}

List<OrderHistoryItem> GetOrderHistoryItems() {
  return [
    OrderHistoryItem(
      imgURL: AppConstants.image,
      title: '',
      quantity: 0,
      price: '',
      onPressed: () {},
    ),
    OrderHistoryItem(
      imgURL: AppConstants.image,
      title: '',
      quantity: 0,
      price: '',
      onPressed: () {},
    ),
    OrderHistoryItem(
      imgURL: AppConstants.image,
      title: '',
      quantity: 0,
      price: '',
      onPressed: () {},
    ),
    OrderHistoryItem(
      imgURL: AppConstants.image,
      title: '',
      quantity: 0,
      price: '',
      onPressed: () {},
    ),
  ];
}
