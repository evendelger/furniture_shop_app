import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.repository}) : super(const CartLoading()) {
    on<ChangeStatus>(_changeStatus);
    on<_AddProduct>(_addProduct);
    on<_RemoveProduct>(_removeProduct);
  }

  final AbstractCartRepository repository;

  Future<void> _changeStatus(
    ChangeStatus event,
    Emitter<CartState> emit,
  ) async {
    final products = await repository.getProducts();
    final product = event.cartProduct.product;

    if (products.contains(product)) {
      add(_RemoveProduct(product: product));
    } else {
      add(_AddProduct(product: product));
    }
  }

  // Future<void> _getStatus(
  //   GetStatus event,
  //   Emitter<CartState> emit,
  // ) async {
  //   final status = await repository.isInCart(event.product);

  // }

  Future<void> _addProduct(
    _AddProduct event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      await repository.add(event.product);
      final productsCopy =
          List<CartProduct>.from((state as CartLoaded).cartProducts);
      productsCopy.add(CartProduct(
        product: event.product,
        inCartValue: 1,
      ));
      emit(CartLoaded(cartProducts: productsCopy));
    }
  }

  Future<void> _removeProduct(
    _RemoveProduct event,
    Emitter<CartState> emit,
  ) async {
    if (state is CartLoaded) {
      await repository.remove(event.product);
      final productsCopy =
          List<CartProduct>.from((state as CartLoaded).cartProducts);
      productsCopy.remove(CartProduct(
        product: event.product,
        inCartValue: 1,
      ));
      emit(CartLoaded(cartProducts: productsCopy));
    }
  }
}
