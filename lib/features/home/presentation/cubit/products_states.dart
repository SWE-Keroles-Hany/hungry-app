import 'package:hungry_app/features/home/domain/entities/category_entity.dart';
import 'package:hungry_app/features/home/domain/entities/product_entity.dart';

abstract class ProductsStates {}

class IntailProductsState implements ProductsStates {}

//!  Products By Category
class ErrorGetProductsByCategoryState implements ProductsStates {
  final String message;
  ErrorGetProductsByCategoryState({required this.message});
}

class LoadingGetProductsByCategoryState implements ProductsStates {}

class SuccessGetProductsByCategoryState implements ProductsStates {
  final List<ProductEntity> products;
  SuccessGetProductsByCategoryState(this.products);
}

//!  Products By name
class ErrorGetProductsByNameState implements ProductsStates {
  final String message;
  ErrorGetProductsByNameState({required this.message});
}

class LoadingGetProductsByNameState implements ProductsStates {}

class SuccessGetProductsByNameState implements ProductsStates {
  final List<ProductEntity> products;
  SuccessGetProductsByNameState(this.products);
}
