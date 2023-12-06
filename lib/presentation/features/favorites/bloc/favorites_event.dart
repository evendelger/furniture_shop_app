part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

// для обновления state от стрима favorites
final class _UpdateFromFavStream extends FavoritesEvent {
  const _UpdateFromFavStream({required this.favPoducts});

  final List<ProductPreview> favPoducts;

  @override
  List<Object?> get props => [favPoducts];
}

// для обновления state от стрима cart
final class _UpdateFromCartStream extends FavoritesEvent {
  const _UpdateFromCartStream({required this.cartProducts});

  final List<CartProductPv> cartProducts;

  @override
  List<Object?> get props => [cartProducts];
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
