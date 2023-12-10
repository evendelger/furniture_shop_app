part of 'products_search_bloc.dart';

sealed class ProductsSearchState extends Equatable {
  const ProductsSearchState();

  @override
  List<Object?> get props => [];
}

final class ProductsSearchLoading extends ProductsSearchState {
  const ProductsSearchLoading();
}

final class ProductsSearchFailed extends ProductsSearchState {
  const ProductsSearchFailed({required this.errorMessage, required this.query});

  final String errorMessage;
  final String query;

  @override
  List<Object?> get props => [errorMessage, query];
}

final class ProductsSearchLoaded extends ProductsSearchState {
  const ProductsSearchLoaded({required this.products});

  final List<ProductsItem> products;

  @override
  List<Object?> get props => [products];
}
