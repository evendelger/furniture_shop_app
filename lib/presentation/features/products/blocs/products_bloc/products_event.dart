part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

final class _ProductsUpdateFromCart extends ProductsEvent {
  const _ProductsUpdateFromCart({required this.cartItems});

  final List<CartItem> cartItems;

  @override
  List<Object?> get props => [cartItems];
}

final class ProductsFetch extends ProductsEvent {
  const ProductsFetch({this.category, this.cartItems});

  final Category? category;
  final List<CartItem>? cartItems;

  @override
  List<Object?> get props => [category, cartItems];
}
