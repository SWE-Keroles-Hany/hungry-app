import 'package:hungry_app/features/home/data/models/category_model.dart';

class CategoriesModel {
  int? code;
  String? message;
  List<CategoryModel>? categories;

  CategoriesModel({this.code, this.message, this.categories});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      categories = <CategoryModel>[];
      json['data'].forEach((v) {
        categories!.add(CategoryModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (categories != null) {
      data['data'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
