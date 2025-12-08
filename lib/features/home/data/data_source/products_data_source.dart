import 'package:hungry_app/features/home/data/models/products_model.dart';

abstract class ProductsDataSource {
  Future<ProductsModel> getProducts({int? categoryId, String? name});
}
