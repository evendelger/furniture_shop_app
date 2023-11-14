import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.repository}) : super(const CartLoading()) {
    on<FetchCart>(_fetchCart);
    on<ChangeValue>(_changeValue);
    on<ChangeCartStatus>(_changeCartStatus);
    on<_AddProduct>(_addProduct);
    on<_RemoveProduct>(_removeProduct);
  }

  final AbstractCartRepository repository;

  Future<void> _fetchCart(
    FetchCart event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartLoading());

    final cartProducts = await repository.getProducts();
    // имитация запроса к api
    await Future.delayed(const Duration(milliseconds: 300));
    emit(CartLoaded(cartProducts: cartProducts));
  }

  Future<void> _changeValue(
    ChangeValue event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      repository.changeValue(event.cartProduct.product.id, event.increase);
      final copyOfState =
          List<CartProduct>.of((state as CartLoaded).cartProducts);
      final productInState = copyOfState
          .firstWhere((pr) => pr.product == event.cartProduct.product);

      if (event.increase && productInState.inCartValue != 99 ||
          !event.increase && productInState.inCartValue != 1) {
        final numberToChange = event.increase ? 1 : -1;
        final productWithChangedValue = productInState.copyWith(
            inCartValue: productInState.inCartValue + numberToChange);
        copyOfState[copyOfState.indexOf(productInState)] =
            productWithChangedValue;

        emit(CartLoaded(cartProducts: copyOfState));
      }
    }
  }

  Future<void> _changeCartStatus(
    ChangeCartStatus event,
    Emitter<CartState> emit,
  ) async {
    final dbCartProducts = await repository.getProducts();

    final founded =
        dbCartProducts.where((cp) => cp.product.id == event.product.id);
    if (founded.isEmpty) {
      add(_AddProduct(product: event.product, countToAdd: event.countToAdd));
    } else {
      add(_RemoveProduct(product: founded.first.product));
    }
  }

  Future<void> _addProduct(
    _AddProduct event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      final valueToAdd = event.countToAdd ?? 1;
      await repository.add(event.product, valueToAdd);
      final productsCopy =
          List<CartProduct>.from((state as CartLoaded).cartProducts);
      productsCopy
          .add(CartProduct(product: event.product, inCartValue: valueToAdd));
      emit(CartLoaded(cartProducts: productsCopy));
    }
  }

  Future<void> _removeProduct(
    _RemoveProduct event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      await repository.remove(event.product.id);
      final productsCopy =
          List<CartProduct>.from((state as CartLoaded).cartProducts);
      productsCopy.removeWhere((prcpy) => prcpy.product.id == event.product.id);
      emit(CartLoaded(cartProducts: productsCopy));
    }
  }
}
