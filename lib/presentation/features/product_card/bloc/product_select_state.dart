part of 'product_select_bloc.dart';

class ProductSelectState extends Equatable {
  const ProductSelectState({
    required this.color,
    this.product,
    required this.count,
  });

  final Color color;
  final Product? product;
  final int count;

  @override
  List<Object?> get props => [color, product, count];

  ProductSelectState copyWith({
    Color? color,
    Product? product,
    int? count,
  }) {
    return ProductSelectState(
      color: color ?? this.color,
      product: product ?? this.product,
      count: count ?? this.count,
    );
  }
}

final class InitialProduct extends ProductSelectState {
  const InitialProduct()
      : super(
          color: AppColors.colorSelect1,
          count: 1,
        );
}
