import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

part 'cart_product.freezed.dart';

@freezed
class CartProductPv with _$CartProductPv {
  const factory CartProductPv({
    required ProductPreview product,
    @Default(1) int inCartValue,
  }) = _CartProductPv;
}

@freezed
class CartProductFl with _$CartProductFl {
  const factory CartProductFl({
    required Product product,
    @Default(1) int inCartValue,
  }) = _CartProductFl;
}
