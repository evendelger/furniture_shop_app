import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
class CartProduct with _$CartProduct {
  const factory CartProduct({
    required Product product,
    @Default(1) int inCartValue,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, Object?> json) =>
      _$CartProductFromJson(json);

  factory CartProduct.fromDbModel(CartDBProduct dbModel) {
    return CartProduct(
      product: Product.fromDbModel(dbModel),
      inCartValue: dbModel.quantity,
    );
  }
}
