import 'package:hungry_app/features/home/domain/entities/product_option_entity.dart';

abstract class SideOptionsStates {}

class InitialSideOptionsState extends SideOptionsStates {}

class LoadingSideOptionsState extends SideOptionsStates {}

class SuccessSideOptionsState extends SideOptionsStates {
  final List<ProductOptionEntity> products;
  SuccessSideOptionsState(this.products);
}

class ErrorSideOptionsState extends SideOptionsStates {
  final String message;
  ErrorSideOptionsState({required this.message});
}
