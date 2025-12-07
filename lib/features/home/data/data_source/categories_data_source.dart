import 'package:hungry_app/features/home/data/models/categorires_model.dart';

abstract class CategoriesDataSource {
  Future<CategoriesModel> getAllCategories();
}
