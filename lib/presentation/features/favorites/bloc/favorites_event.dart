part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

final class FetchFavoritesState extends FavoritesEvent {
  const FetchFavoritesState();
}

final class ChangeFavoriteCartStatus extends FavoritesEvent {
  const ChangeFavoriteCartStatus({required this.favProduct});

  final FavoriteProduct favProduct;

  @override
  List<Object?> get props => [favProduct];
}

// для обновления state от стрима favorites
final class _UpdateFromFavStream extends FavoritesEvent {
  const _UpdateFromFavStream({required this.favPoducts});

  final ProductPvList favPoducts;

  @override
  List<Object?> get props => [favPoducts];
}

// для обновления state от стрима cart
final class _UpdateFromCartStream extends FavoritesEvent {
  const _UpdateFromCartStream({required this.cartItems});

  final List<CartItem> cartItems;

  @override
  List<Object?> get props => [cartItems];
}

final class AddFavoriteProduct extends FavoritesEvent {
  const AddFavoriteProduct({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

final class RemoveFavoriteProduct extends FavoritesEvent {
  const RemoveFavoriteProduct({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

final class AddAllFavoritesToCart extends FavoritesEvent {
  const AddAllFavoritesToCart();
}
