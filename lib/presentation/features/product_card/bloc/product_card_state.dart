part of 'product_card_bloc.dart';

sealed class ProductCardState extends Equatable {
  const ProductCardState();
}

final class ProductCardLoading extends ProductCardState {
  const ProductCardLoading();

  @override
  List<Object?> get props => [];
}

final class ProductCardFailed extends ProductCardState {
  const ProductCardFailed({required this.errorMessage});

  final String errorMessage;

  @override
  List<Object?> get props => [errorMessage];
}

final class ProductCardLoaded extends ProductCardState {
  const ProductCardLoaded({
    this.color = AppColors.colorSelect1,
    required this.product,
    required this.isFavorite,
    required this.isInCart,
    this.inCartValue,
  });

  final Color color;
  final Product product;
  final int? inCartValue;
  final bool isFavorite;
  final bool isInCart;

  @override
  List<Object?> get props => [
        color,
        product,
        inCartValue,
        isFavorite,
        isInCart,
      ];

  ProductCardState copyWith({
    Color? color,
    Product? product,
    int? inCartValue,
    bool? isFavorite,
    bool? isInCart,
  }) {
    return ProductCardLoaded(
      color: color ?? this.color,
      product: product ?? this.product,
      inCartValue: inCartValue ?? this.inCartValue,
      isFavorite: isFavorite ?? this.isFavorite,
      isInCart: isInCart ?? this.isInCart,
    );
  }
}
