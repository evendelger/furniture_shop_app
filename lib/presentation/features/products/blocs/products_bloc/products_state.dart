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
  const ProductsFailed({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}

final class ProductsLoaded extends ProductsState {
  const ProductsLoaded({required this.products});

  final List<Product> products;

  @override
  List<Object?> get props => [products];
}
