import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_products_by_name.dart';
import 'products_states.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  final GetProducts getProductsUseCase;

  ProductsCubit(this.getProductsUseCase) : super(InitialProductsState());

  Future<void> getProducts({String? name, int? categoryId}) async {
    emit(LoadingGetProductsState());

    final response = await getProductsUseCase.getProducts(
      name: name,
      categoryId: categoryId,
    );

    response.fold(
      (failure) {
        emit(ErrorGetProductsState(message: failure.message));
      },
      (response) {
        emit(SuccessGetProductsState(response.products ?? []));
      },
    );
  }
}
