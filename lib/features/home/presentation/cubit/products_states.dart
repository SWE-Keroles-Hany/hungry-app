import 'package:hungry_app/features/home/domain/entities/product_entity.dart';
import 'package:hungry_app/features/home/domain/entities/product_option_entity.dart';
import 'package:hungry_app/features/home/domain/entities/product_options_entity.dart';

abstract class ProductsStates {}

class IntailProductsState implements ProductsStates {}

//!  Products
class ErrorGetProductsState implements ProductsStates {
  final String message;
  ErrorGetProductsState({required this.message});
}

class LoadingGetProductsState implements ProductsStates {}

class SuccessGetProductsState implements ProductsStates {
  final List<ProductEntity> products;
  SuccessGetProductsState(this.products);
}

//! Side Options Products
class ErrorGetSideOptoinProductsState implements ProductsStates {
  final String message;
  ErrorGetSideOptoinProductsState({required this.message});
}

class LoadingGetSideOptoinProductsState implements ProductsStates {}

class SuccessGetSideOptoinProductsState implements ProductsStates {
  final List<ProductOptionEntity> products;
  SuccessGetSideOptoinProductsState(this.products);
}

//! Side Options Products
class ErrorGetToppgingsProductsState implements ProductsStates {
  final String message;
  ErrorGetToppgingsProductsState({required this.message});
}

class LoadingGetToppgingsProductsState implements ProductsStates {}

class SuccessGetToppgingsProductsState implements ProductsStates {
  final List<ProductOptionEntity> products;
  SuccessGetToppgingsProductsState(this.products);
}
