part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

// для обновления state от стрима
final class _UpdateRawState extends CartEvent {
  const _UpdateRawState({required this.cartItems});

  final List<CartItem> cartItems;

  @override
  List<Object?> get props => [cartItems];
}

// для конвертации raw state в full state
final class UpdateFullState extends CartEvent {
  const UpdateFullState();
}

final class ChangeCartValue extends CartEvent {
  const ChangeCartValue({
    required this.id,
    required this.increase,
  });

  final String id;
  final bool increase;

  @override
  List<Object?> get props => [id, increase];
}

final class AddCartProduct extends CartEvent {
  const AddCartProduct({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

final class RemoveCartProduct extends CartEvent {
  const RemoveCartProduct({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}
