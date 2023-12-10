part of 'product_card_bloc.dart';

sealed class ProductCardEvent extends Equatable {
  const ProductCardEvent();

  @override
  List<Object?> get props => [];
}

final class ProductCardChangeFavoriteStatus extends ProductCardEvent {
  const ProductCardChangeFavoriteStatus();
}

final class ProductCardChangeCartStatus extends ProductCardEvent {
  const ProductCardChangeCartStatus();
}

final class ProductCardOpen extends ProductCardEvent {
  const ProductCardOpen({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

final class ProductCardChangeColor extends ProductCardEvent {
  const ProductCardChangeColor({
    required this.color,
  });

  final Color color;

  @override
  List<Object?> get props => [color];
}

final class ProductCardChangeCount extends ProductCardEvent {
  const ProductCardChangeCount({
    required this.increment,
  });

  final bool increment;

  @override
  List<Object?> get props => [increment];
}
