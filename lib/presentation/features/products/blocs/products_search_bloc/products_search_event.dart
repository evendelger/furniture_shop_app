part of 'products_search_bloc.dart';

sealed class ProductsSearchEvent extends Equatable {
  const ProductsSearchEvent();

  @override
  List<Object?> get props => [];
}

final class _ProductsSearchUpdateFromCart extends ProductsSearchEvent {
  const _ProductsSearchUpdateFromCart({required this.cartItems});

  final List<CartItem> cartItems;

  @override
  List<Object?> get props => [cartItems];
}

final class ProductsSearchByQuery extends ProductsSearchEvent {
  const ProductsSearchByQuery({required this.query, this.cartItems});

  final String query;
  final List<CartItem>? cartItems;

  @override
  List<Object?> get props => [query, cartItems];
}
