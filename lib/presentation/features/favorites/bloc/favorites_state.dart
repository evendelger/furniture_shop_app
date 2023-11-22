part of 'favorites_bloc.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object?> get props => [];
}

final class FavoritesLoading extends FavoritesState {
  const FavoritesLoading();
}

final class FavoritesLoaded extends FavoritesState {
  const FavoritesLoaded({
    required this.products,
  });

  final List<Product> products;

  FavoritesLoaded copyWith({
    List<Product>? products,
  }) {
    return FavoritesLoaded(
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [...products];
}