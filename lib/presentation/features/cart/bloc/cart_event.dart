part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

final class FetchCart extends CartEvent {
  const FetchCart();
}

final class ChangeValue extends CartEvent {
  const ChangeValue({
    required this.cartProduct,
    required this.increase,
  });

  final CartProduct cartProduct;
  final bool increase;

  @override
  List<Object?> get props => [cartProduct];
}

final class ChangeCartStatus extends CartEvent {
  const ChangeCartStatus({
    required this.product,
    this.countToAdd,
  });

  final Product product;
  final int? countToAdd;

  @override
  List<Object?> get props => [product, countToAdd];
}

final class _AddProduct extends CartEvent {
  const _AddProduct({
    required this.product,
    this.countToAdd,
  });

  final Product product;
  final int? countToAdd;

  @override
  List<Object?> get props => [product, countToAdd];
}

final class _RemoveProduct extends CartEvent {
  const _RemoveProduct({
    required this.product,
  });

  final Product product;

  @override
  List<Object?> get props => [product];
}
