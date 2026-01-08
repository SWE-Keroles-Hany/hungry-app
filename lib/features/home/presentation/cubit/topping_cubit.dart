import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_toppings_products.dart';
import 'toppings_states.dart';

class ToppingsCubit extends Cubit<ToppingsStates> {
  final GetToppingsProducts getToppingsProducts;

  ToppingsCubit(this.getToppingsProducts) : super(InitialToppingsState());

  Future<void> getToppings() async {
    emit(LoadingToppingsState());

    final response = await getToppingsProducts.getToppings();
    response.fold(
      (failure) {
        emit(ErrorToppingsState(message: failure.message));
      },
      (response) {
        response.productOptions;
        emit(SuccessToppingsState(response.productOptions ?? []));
      },
    );
  }
}
