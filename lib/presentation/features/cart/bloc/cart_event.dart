part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

final class FetchProducts extends CartEvent {
  const FetchProducts();
}

final class ChangeValue extends CartEvent {
  const ChangeValue({
    required this.product,
    required this.increase,
  });

  final CartProduct product;
  final bool increase;

  @override
  List<Object?> get props => [product];
}

final class ChangeStatus extends CartEvent {
  const ChangeStatus({required this.cartProduct});

  final CartProduct cartProduct;

  @override
  List<Object?> get props => [cartProduct];
}

final class _AddProduct extends CartEvent {
  const _AddProduct({
    required this.product,
  });

  final Product product;

  @override
  List<Object?> get props => [product];
}

final class _RemoveProduct extends CartEvent {
  const _RemoveProduct({
    required this.product,
  });

  final Product product;

  @override
  List<Object?> get props => [product];
}
