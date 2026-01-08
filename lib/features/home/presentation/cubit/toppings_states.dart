import 'package:hungry_app/features/home/domain/entities/product_entity.dart';
import 'package:hungry_app/features/home/domain/entities/product_option_entity.dart';

abstract class ToppingsStates {}

class InitialToppingsState extends ToppingsStates {}

class LoadingToppingsState extends ToppingsStates {}

class SuccessToppingsState extends ToppingsStates {
  final List<ProductOptionEntity> products;
  SuccessToppingsState(this.products);
}

class ErrorToppingsState extends ToppingsStates {
  final String message;
  ErrorToppingsState({required this.message});
}
