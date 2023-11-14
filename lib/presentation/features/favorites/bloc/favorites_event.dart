part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

final class FetchProducts extends FavoritesEvent {
  const FetchProducts();
}

final class ChangeStatus extends FavoritesEvent {
  const ChangeStatus({
    required this.product,
  });

  final Product product;

  @override
  List<Object?> get props => [product];
}

final class _AddProduct extends FavoritesEvent {
  const _AddProduct({
    required this.product,
  });

  final Product product;

  @override
  List<Object?> get props => [product];
}

final class _RemoveProduct extends FavoritesEvent {
  const _RemoveProduct({
    required this.product,
  });

  final Product product;

  @override
  List<Object?> get props => [product];
}

final class AddAllToCart extends FavoritesEvent {
  const AddAllToCart();
}
