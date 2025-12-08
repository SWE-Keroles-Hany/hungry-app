import 'package:hungry_app/features/home/data/models/product_option.dart';
import 'package:hungry_app/features/home/domain/entities/product_option_entity.dart';

extension ProductOptionMapper on ProductOptionModel {
  ProductOptionEntity get toEntity => ProductOptionEntity(id, image, name);
}
