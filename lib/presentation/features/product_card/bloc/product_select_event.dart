part of 'product_select_bloc.dart';

sealed class ProductSelectEvent extends Equatable {
  const ProductSelectEvent();

  @override
  List<Object?> get props => [];
}

final class ChangeProduct extends ProductSelectEvent {
  const ChangeProduct({
    required this.product,
  });

  final Product product;

  @override
  List<Object?> get props => [product];
}

final class ChangeColor extends ProductSelectEvent {
  const ChangeColor({
    required this.color,
  });

  final Color color;

  @override
  List<Object?> get props => [color];
}

final class ChangeCount extends ProductSelectEvent {
  const ChangeCount({
    required this.isAdd,
  });

  final bool isAdd;

  @override
  List<Object?> get props => [isAdd];
}
