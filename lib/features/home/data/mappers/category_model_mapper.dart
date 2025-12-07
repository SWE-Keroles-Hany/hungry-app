import 'package:hungry_app/features/home/data/models/category_model.dart';
import 'package:hungry_app/features/home/domain/entities/category_entity.dart';

extension CategoryModelMapper on CategoryModel {
  CategoryEntity get toEntity => CategoryEntity(id: id, name: name);
}
