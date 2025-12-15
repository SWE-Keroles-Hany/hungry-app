import 'package:hungry_app/features/cart/domain/entities/cart_list_response_entity.dart';

abstract class CartStates {}

class IntialCartState implements CartStates {}

//! Add

class ErrorAddToCartState implements CartStates {
  final String message;
  ErrorAddToCartState(this.message);
}

class LoadingAddToCartState implements CartStates {}

class SuccessAddToCartState implements CartStates {}

//! get
class ErrorGetCartState implements CartStates {
  final String message;
  ErrorGetCartState(this.message);
}

class LoadingGetCartState implements CartStates {}

class SuccessGetCartState implements CartStates {
  final CartListResponseEntity cartList;
  SuccessGetCartState(this.cartList);
}

//! delete
class ErrorDeleteFromCartState implements CartStates {
  final String message;
  ErrorDeleteFromCartState(this.message);
}

class LoadingDeleteFromCartState implements CartStates {}

class SuccessDeleteFromCartState implements CartStates {}
