import 'package:hungry_app/features/cart/data/models/cart_list_response_model.dart';

class GetCartResponseModel {
  int? code;
  String? message;
  CartListResponseModel? cartList;

  GetCartResponseModel({this.code, this.message, this.cartList});

  GetCartResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    cartList = json['data'] != null
        ? CartListResponseModel.fromJson(json['data'])
        : null;
  }
}
