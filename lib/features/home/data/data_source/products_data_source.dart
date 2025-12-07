import 'package:hungry_app/features/home/data/models/products_model.dart';

abstract class ProductsDataSource {
  Future<ProductsModel> getProductsByCategory({int? categoryId});
  Future<ProductsModel> getProductsByName({required String name});
}
