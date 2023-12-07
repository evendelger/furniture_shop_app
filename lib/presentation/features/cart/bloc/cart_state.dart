part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

final class CartLoading extends CartState {
  const CartLoading();
}

final class CartLoadedRaw extends CartState {
  const CartLoadedRaw({
    required this.cartItems,
  });

  final List<CartItem> cartItems;

  @override
  List<Object?> get props => [cartItems];
}

final class CartLoadedFull extends CartState {
  const CartLoadedFull({
    required this.cartProducts,
  });

  final List<CartProductPv> cartProducts;

  @override
  List<Object?> get props => [cartProducts];
}
