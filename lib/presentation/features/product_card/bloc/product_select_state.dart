part of 'product_select_bloc.dart';

class ProductSelectState extends Equatable {
  const ProductSelectState({
    required this.color,
    this.product,
    required this.count,
    required this.isFavorite,
  });

  final Color color;
  final Product? product;
  final int count;
  final bool isFavorite;

  @override
  List<Object?> get props => [color, product, count, isFavorite];

  ProductSelectState copyWith({
    Color? color,
    Product? product,
    int? count,
    bool? isFavorite,
  }) {
    return ProductSelectState(
      color: color ?? this.color,
      product: product ?? this.product,
      count: count ?? this.count,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

final class InitialProduct extends ProductSelectState {
  const InitialProduct()
      : super(
          color: AppColors.colorSelect1,
          count: 1,
          isFavorite: false,
        );
}
