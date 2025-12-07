import 'package:hungry_app/features/home/data/models/product_model.dart';
import 'package:hungry_app/features/home/domain/entities/product_entity.dart';

extension ProductModelMapper on ProductModel {
  ProductEntity get toEntity => ProductEntity(
    id: id,
    name: name,
    description: description,
    image: image,
    price: price,
    rating: rating,
  );
}
