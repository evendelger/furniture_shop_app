import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

part 'cart_product.freezed.dart';
part 'cart_product.g.dart';

@freezed
class CartProduct with _$CartProduct {
  const factory CartProduct({
    required Product product,
    required int inCartValue,
  }) = _CartProduct;

  factory CartProduct.fromJson(Map<String, Object?> json) =>
      _$CartProductFromJson(json);
}
