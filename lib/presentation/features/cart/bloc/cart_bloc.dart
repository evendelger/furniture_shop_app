import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required AbstractCartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(const CartLoading()) {
    on<ChangeCartValue>(_changeValue);
    on<AddCartProduct>(_addProduct);
    on<RemoveCartProduct>(_removeProduct);
    on<_UpdateRawState>(_updateRawState);
    on<UpdateFullState>(_updateFullState);

    // подписываюсь на стрим cart
    _cartProductsSub = _cartRepository.cartStream.listen(
      (cartItems) => add(_UpdateRawState(cartItems: cartItems)),
    );
  }

  final AbstractCartRepository _cartRepository;
  late final StreamSubscription _cartProductsSub;

  void _updateRawState(_UpdateRawState event, Emitter<CartState> emit) {
    if (state is CartLoadedFull) {
      final stateProducts = (state as CartLoadedFull).cartProducts;
      final newState = <CartProductPv>[];
      if (stateProducts.length < event.cartItems.length) {
        add(const UpdateFullState());
        return;
      }

      for (int i = 0; i < event.cartItems.length; i++) {
        final cartItem = event.cartItems[i];
        final cartProduct = stateProducts.firstWhereOrNull(
          (sp) => sp.product.id == cartItem.id,
        );
        if (cartProduct != null) {
          if (cartProduct.inCartValue == cartItem.value) {
            newState.add(cartProduct);
          } else {
            newState.add(CartProductPv(
              product: cartProduct.product,
              inCartValue: cartItem.value!,
            ));
          }
        }
      }
      emit(CartLoadedFull(cartProducts: newState));
    } else {
      emit(CartLoadedRaw(cartItems: event.cartItems));
    }
  }

  Future<void> _updateFullState(
    UpdateFullState event,
    Emitter<CartState> emit,
  ) async {
    final cartItems = state is CartLoadedRaw
        ? (state as CartLoadedRaw).cartItems
        : _cartRepository.lastStreamEvent;
    if (cartItems == null) return;

    final cartProducts = await _cartRepository.convertRawItems(cartItems);
    emit(CartLoadedFull(cartProducts: cartProducts));
  }

  Future<void> _changeValue(
    ChangeCartValue event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoadedFull) {
      await _cartRepository.changeValue(
        id: event.id,
        increase: event.increase,
      );
    }
  }

  Future<void> _addProduct(
    AddCartProduct event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoadedFull) {
      await _cartRepository.add(id: event.id);
    }
  }

  Future<void> _removeProduct(
    RemoveCartProduct event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoadedFull) {
      await _cartRepository.remove(id: event.id);
    }
  }

  // отменяю подписку
  @override
  Future<void> close() {
    _cartProductsSub.cancel();
    return super.close();
  }
}
