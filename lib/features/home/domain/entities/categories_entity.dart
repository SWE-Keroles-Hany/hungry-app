import 'package:hungry_app/features/home/domain/entities/category_entity.dart';

class CategoriesEntity {
  int? code;
  String? message;
  List<CategoryEntity>? categories;

  CategoriesEntity({this.code, this.message, this.categories});
}
