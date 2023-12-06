part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object?> get props => [];
}

final class CartLoading extends CartState {
  const CartLoading();
}

final class CartLoaded extends CartState {
  const CartLoaded({
    required this.cartProducts,
  });

  final List<CartProductPv> cartProducts;

  CartLoaded copyWith({
    List<CartProductPv>? cartProducts,
  }) {
    return CartLoaded(
      cartProducts: cartProducts ?? this.cartProducts,
    );
  }

  @override
  List<Object?> get props => [cartProducts];
}
