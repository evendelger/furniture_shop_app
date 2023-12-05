part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

final class FetchFavorites extends FavoritesEvent {
  const FetchFavorites();
}

final class AddProduct extends FavoritesEvent {
  const AddProduct({
    required this.product,
  });

  final ProductPreview product;

  @override
  List<Object?> get props => [product];
}

final class RemoveProduct extends FavoritesEvent {
  const RemoveProduct({
    required this.product,
  });

  final ProductPreview product;

  @override
  List<Object?> get props => [product];
}

final class AddAllToCart extends FavoritesEvent {
  const AddAllToCart();
}
