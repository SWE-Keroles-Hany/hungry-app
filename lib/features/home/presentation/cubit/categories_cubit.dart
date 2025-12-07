import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/home/domain/use_cases/get_all_categories.dart';
import 'package:hungry_app/features/home/presentation/cubit/categories_states.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  final GetAllCategories _getAllCategories;
  CategoriesCubit(this._getAllCategories) : super(IntailCategoriesState());
  Future<void> getAllCategorires() async {
    emit(LoadingGetAllCategoriesState());
    final response = await _getAllCategories.getAllCategories();
    response.fold(
      (failure) {
        emit(ErrorGetAllCategoriesState(message: failure.message));
      },
      (response) {
        final categories = response.categories ?? [];
        emit(SuccessGetAllCategoriesState(categories));
      },
    );
  }
}
