import 'package:hungry_app/features/home/domain/entities/product_entity.dart';

abstract class ProductsStates {}

class IntailProductsState implements ProductsStates {}

//!  Products By Category
class ErrorGetProductsState implements ProductsStates {
  final String message;
  ErrorGetProductsState({required this.message});
}

class LoadingGetProductsState implements ProductsStates {}

class SuccessGetProductsState implements ProductsStates {
  final List<ProductEntity> products;
  SuccessGetProductsState(this.products);
}
