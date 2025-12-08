import 'package:hungry_app/features/home/data/mappers/product_option_mapper.dart';
import 'package:hungry_app/features/home/data/models/product_options_model.dart';
import 'package:hungry_app/features/home/domain/entities/product_options_entity.dart';

extension ProductOptionsMapper on ProductOptionsModel {
  ProductOptionsEntity get toEntity => ProductOptionsEntity(
    productOptions: productOptions?.map((item) => item.toEntity).toList(),
  );
}
