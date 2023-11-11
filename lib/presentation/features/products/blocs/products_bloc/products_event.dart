part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

final class LoadProducts extends ProductsEvent {
  const LoadProducts({required this.category});

  final Category category;

  @override
  List<Object?> get props => [category];
}
