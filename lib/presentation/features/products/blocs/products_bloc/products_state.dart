part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

final class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

final class ProductsFailed extends ProductsState {
  const ProductsFailed({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

final class ProductsLoaded extends ProductsState {
  const ProductsLoaded({required this.category, required this.products});

  final List<ProductsItem> products;
  final Category category;

  @override
  List<Object?> get props => [products, category];
}
