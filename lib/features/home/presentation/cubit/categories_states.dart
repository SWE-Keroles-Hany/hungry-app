import 'package:hungry_app/features/home/domain/entities/category_entity.dart';

abstract class CategoriesStates {}

class IntailCategoriesState implements CategoriesStates {}

//!  Get All Categories
class ErrorGetAllCategoriesState implements CategoriesStates {
  final String message;
  ErrorGetAllCategoriesState({required this.message});
}

class LoadingGetAllCategoriesState implements CategoriesStates {}

class SuccessGetAllCategoriesState implements CategoriesStates {
  final List<CategoryEntity> categories;
  SuccessGetAllCategoriesState(this.categories);
}
