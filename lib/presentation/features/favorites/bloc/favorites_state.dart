part of 'favorites_bloc.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object?> get props => [];
}

final class FavoritesLoading extends FavoritesState {
  const FavoritesLoading();
}

final class FavoritesFailed extends FavoritesState {
  const FavoritesFailed({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

final class FavoritesLoaded extends FavoritesState {
  const FavoritesLoaded({
    required this.products,
  });

  final List<FavoriteProduct> products;

  FavoritesLoaded copyWith({
    List<FavoriteProduct>? products,
  }) {
    return FavoritesLoaded(
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [...products];
}
