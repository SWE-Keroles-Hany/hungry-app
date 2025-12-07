import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_products_by_category.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_products_by_name.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_states.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  final GetProductsByCategory _getProductsByCategory;
  final GetProductsByName _getProductsByName;

  ProductsCubit(this._getProductsByCategory, this._getProductsByName)
    : super(IntailProductsState());

  Future<void> getProductsByName({required String name}) async {
    emit(LoadingGetProductsByNameState());
    final response = await _getProductsByName.getProductsByName(name: name);
    response.fold(
      (failure) {
        emit(ErrorGetProductsByNameState(message: failure.message));
      },
      (response) {
        final categories = response.products ?? [];
        emit(SuccessGetProductsByNameState(categories));
      },
    );
  }

  Future<void> getProductsByCategory({int? categoryId}) async {
    emit(LoadingGetProductsByCategoryState());
    final response = await _getProductsByCategory.getProductsByCategory(
      categoryId: categoryId,
    );
    response.fold(
      (failure) {
        emit(ErrorGetProductsByCategoryState(message: failure.message));
      },
      (response) {
        final categories = response.products ?? [];
        emit(SuccessGetProductsByCategoryState(categories));
      },
    );
  }
}
