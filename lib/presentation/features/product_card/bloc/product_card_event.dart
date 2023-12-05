part of 'product_card_bloc.dart';

sealed class ProductCardEvent extends Equatable {
  const ProductCardEvent();

  @override
  List<Object?> get props => [];
}

final class ChangeFavoriteStatus extends ProductCardEvent {
  const ChangeFavoriteStatus();
}

final class OpenProductCard extends ProductCardEvent {
  const OpenProductCard({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

final class ChangeColor extends ProductCardEvent {
  const ChangeColor({
    required this.color,
  });

  final Color color;

  @override
  List<Object?> get props => [color];
}

final class ChangeCount extends ProductCardEvent {
  const ChangeCount({
    required this.isAdd,
  });

  final bool isAdd;

  @override
  List<Object?> get props => [isAdd];
}
