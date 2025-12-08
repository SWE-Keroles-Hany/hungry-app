import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_products_by_name.dart';
import 'package:hungry_app/features/home/presentation/cubit/products_states.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  final GetProducts _getProducts;

  ProductsCubit(this._getProducts) : super(IntailProductsState());

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
}
