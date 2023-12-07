part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

final class _UpdateFromCartState extends ProductsEvent {
  const _UpdateFromCartState({required this.cartItems});

  final List<CartItem> cartItems;

  @override
  List<Object?> get props => [cartItems];
}

final class FetchProducts extends ProductsEvent {
  const FetchProducts({this.category, this.cartItems});

  final Category? category;
  final List<CartItem>? cartItems;

  @override
  List<Object?> get props => [category, cartItems];
}
