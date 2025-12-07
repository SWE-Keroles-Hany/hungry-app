import 'package:hungry_app/features/home/data/mappers/category_model_mapper.dart';
import 'package:hungry_app/features/home/data/models/categorires_model.dart';
import 'package:hungry_app/features/home/domain/entities/categories_entity.dart';

extension CategoriesModelMapper on CategoriesModel {
  CategoriesEntity get toEntity => CategoriesEntity(
    message: message,
    code: code,
    categories: categories?.map((item) => item.toEntity).toList(),
  );
}
