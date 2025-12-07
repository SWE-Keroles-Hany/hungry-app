import 'package:hungry_app/features/home/data/mappers/product_model_mapper.dart';
import 'package:hungry_app/features/home/data/models/products_model.dart';
import 'package:hungry_app/features/home/domain/entities/products_entity.dart';

extension ProductsModelMapper on ProductsModel {
  ProductsEntity get toEntity => ProductsEntity(
    code: code,
    message: message,
    products: products?.map((item) => item.toEntity).toList(),
  );
}
