import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/features/cart/domain/entities/cart_item_request_entity.dart';
import 'package:hungry_app/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:hungry_app/features/cart/domain/use_cases/delete_from_cart.dart';
import 'package:hungry_app/features/cart/domain/use_cases/get_cart.dart';
import 'package:hungry_app/features/cart/presentation/cubit/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  final AddToCart _addToCart;
  final GetCart _getCart;
  final DeleteFromCart _deleteFromCart;
  CartCubit(this._addToCart, this._deleteFromCart, this._getCart)
    : super(IntialCartState());

  Future<void> addToCart({required CartItemRequestEntity cartItem}) async {
    emit(LoadingAddToCartState());
    final result = await _addToCart.addToCart(cartItem: cartItem);
    result.fold((failure) {
      emit(ErrorAddToCartState(failure.message));
    }, (_) => emit(SuccessAddToCartState()));
  }

  Future<void> getCart() async {
    emit(LoadingGetCartState());
    final result = await _getCart.getCart();
    result.fold(
      (failure) {
        emit(ErrorGetCartState(failure.message));
      },
      (cart) {
        emit(SuccessGetCartState(cart));
      },
    );
  }

  Future<void> deleteFromCart({required int productId}) async {
    emit(LoadingDeleteFromCartState());
    final result = await _deleteFromCart.deleteFromCart(productId: productId);
    result.fold(
      (failure) {
        emit(ErrorDeleteFromCartState(failure.message));
      },
      (_) async {
        emit(SuccessDeleteFromCartState());
      },
    );
  }
}
