import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_products_by_name.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_side_options_products.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_toppings_products.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_states.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  final GetProducts _getProducts;
  final GetSideOptionsProducts _getSideOptionsProducts;
  final GetToppingsProducts _getToppingsProducts;
  ProductsCubit(
    this._getProducts,
    this._getSideOptionsProducts,
    this._getToppingsProducts,
  ) : super(IntailProductsState());

  Future<void> getProducts({String? name, int? categoryId}) async {
    emit(LoadingGetProductsState());
    final response = await _getProducts.getProducts(
      categoryId: categoryId,
      name: name,
    );
    response.fold(
      (failure) {
        emit(ErrorGetProductsState(message: failure.message));
      },
      (response) {
        final products = response.products ?? [];
        emit(SuccessGetProductsState(products));
      },
    );
  }

  Future<void> getSideOptionsProducts() async {
    emit(LoadingGetSideOptoinProductsState());
    final response = await _getSideOptionsProducts.getSideOptions();
    response.fold(
      (failure) {
        emit(ErrorGetSideOptoinProductsState(message: failure.message));
      },
      (response) {
        final products = response.productOptions ?? [];
        emit(SuccessGetSideOptoinProductsState(products));
      },
    );
  }

  Future<void> getToppings() async {
    emit(LoadingGetToppgingsProductsState());
    final response = await _getToppingsProducts.getToppings();
    response.fold(
      (failure) {
        emit(ErrorGetToppgingsProductsState(message: failure.message));
      },
      (response) {
        final products = response.productOptions ?? [];
        emit(SuccessGetToppgingsProductsState(products));
      },
    );
  }
}
