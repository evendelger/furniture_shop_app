import 'dart:async';

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
    on<_UpdateState>(_updateState);

    // подписываюсь на стрим cart
    _cartProductsSub = _cartRepository.streamProducts().listen(
          (cartProducts) => add(_UpdateState(products: cartProducts)),
          //onError: (_) => {},
        );
  }

  final AbstractCartRepository _cartRepository;
  late final StreamSubscription _cartProductsSub;

  void _updateState(_UpdateState event, Emitter<CartState> emit) =>
      emit(CartLoaded(cartProducts: event.products));

  Future<void> _changeValue(
    ChangeCartValue event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
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
    if (state is CartLoaded) {
      await _cartRepository.add(id: event.id);
    }
  }

  Future<void> _removeProduct(
    RemoveCartProduct event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
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
