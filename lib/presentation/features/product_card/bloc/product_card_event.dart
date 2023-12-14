part of 'product_card_bloc.dart';

sealed class ProductCardEvent extends Equatable {
  const ProductCardEvent();

  @override
  List<Object?> get props => [];
}

final class CardChangeFavoriteStatus extends ProductCardEvent {
  const CardChangeFavoriteStatus();
}

final class CardChangeCartStatus extends ProductCardEvent {
  const CardChangeCartStatus();
}

final class CardOpen extends ProductCardEvent {
  const CardOpen({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}

final class CardChangeColor extends ProductCardEvent {
  const CardChangeColor({
    required this.color,
  });

  final Color color;

  @override
  List<Object?> get props => [color];
}

final class CardChangeCount extends ProductCardEvent {
  const CardChangeCount({
    required this.increment,
  });

  final bool increment;

  @override
  List<Object?> get props => [increment];
}
