part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

final class FavoritesFetchState extends FavoritesEvent {
  const FavoritesFetchState({required this.selfFetch});

  final bool selfFetch;

  @override
  List<Object?> get props => [selfFetch];
}

final class FavoritesChangeCartStatus extends FavoritesEvent {
  const FavoritesChangeCartStatus({required this.favProduct});

  final FavoriteProduct favProduct;

  @override
  List<Object?> get props => [favProduct];
}

// для обновления state от стрима favorites
final class _FavoritesUpdateFromFavStream extends FavoritesEvent {
  const _FavoritesUpdateFromFavStream({required this.favPoducts});

  final ProductPvList favPoducts;

  @override
  List<Object?> get props => [favPoducts];
}

// для обновления state от стрима cart
final class _FavoritesUpdateFromCartStream extends FavoritesEvent {
  const _FavoritesUpdateFromCartStream({required this.cartItems});

  final List<CartItem> cartItems;

  @override
  List<Object?> get props => [cartItems];
}

final class FavoritesAddProduct extends FavoritesEvent {
  const FavoritesAddProduct({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

final class FavoritesRemoveProduct extends FavoritesEvent {
  const FavoritesRemoveProduct({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

final class FavoritesAddAllToCart extends FavoritesEvent {
  const FavoritesAddAllToCart();
}
