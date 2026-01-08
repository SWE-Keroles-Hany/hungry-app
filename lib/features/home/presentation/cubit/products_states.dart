import 'package:hungry_app/features/home/domain/entities/product_entity.dart';

abstract class ProductsStates {}

class InitialProductsState extends ProductsStates {}

class LoadingGetProductsState extends ProductsStates {}

class SuccessGetProductsState extends ProductsStates {
  final List<ProductEntity> products;
  SuccessGetProductsState(this.products);
}

class ErrorGetProductsState extends ProductsStates {
  final String message;
  ErrorGetProductsState({required this.message});
}
