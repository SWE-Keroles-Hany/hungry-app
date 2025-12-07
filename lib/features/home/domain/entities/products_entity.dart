import 'package:hungry_app/features/home/domain/entities/product_entity.dart';

class ProductsEntity {
  int? code;
  String? message;
  List<ProductEntity>? products;

  ProductsEntity({this.code, this.message, this.products});
}
