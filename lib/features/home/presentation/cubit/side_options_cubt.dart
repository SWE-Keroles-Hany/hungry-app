import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_side_options_products.dart';
import 'side_options_states.dart';

class SideOptionsCubit extends Cubit<SideOptionsStates> {
  final GetSideOptionsProducts getSideOptionsProducts;

  SideOptionsCubit(this.getSideOptionsProducts)
    : super(InitialSideOptionsState());

  Future<void> getSideOptions() async {
    emit(LoadingSideOptionsState());

    final response = await getSideOptionsProducts.getSideOptions();
    response.fold(
      (failure) {
        emit(ErrorSideOptionsState(message: failure.message));
      },
      (response) {
        emit(SuccessSideOptionsState(response.productOptions ?? []));
      },
    );
  }
}
