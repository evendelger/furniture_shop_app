part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

// для обновления state от стрима
final class _CartUpdateRawState extends CartEvent {
  const _CartUpdateRawState({required this.cartItems});

  final List<CartItem> cartItems;

  @override
  List<Object?> get props => [cartItems];
}

// для конвертации raw state в full state
final class CartUpdateFullState extends CartEvent {
  const CartUpdateFullState();
}

final class CartChangeValue extends CartEvent {
  const CartChangeValue({
    required this.id,
    required this.increase,
  });

  final String id;
  final bool increase;

  @override
  List<Object?> get props => [id, increase];
}

final class CartAddProduct extends CartEvent {
  const CartAddProduct({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

final class CartRemoveProduct extends CartEvent {
  const CartRemoveProduct({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}
