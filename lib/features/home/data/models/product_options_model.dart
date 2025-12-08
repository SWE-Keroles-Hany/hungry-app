import 'package:hungry_app/features/home/data/models/product_option.dart';

class ProductOptionsModel {
  int? code;
  String? message;
  List<ProductOptionModel>? productOptions;

  ProductOptionsModel({this.code, this.message, this.productOptions});

  ProductOptionsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      productOptions = <ProductOptionModel>[];
      json['data'].forEach((v) {
        productOptions!.add(ProductOptionModel.fromJson(v));
      });
    }
  }
}
