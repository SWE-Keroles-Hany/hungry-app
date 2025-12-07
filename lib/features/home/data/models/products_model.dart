import 'package:hungry_app/features/home/data/models/product_model.dart';

class ProductsModel {
  int? code;
  String? message;
  List<ProductModel>? products;

  ProductsModel({this.code, this.message, this.products});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      products = <ProductModel>[];
      json['data'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (products != null) {
      data['data'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
