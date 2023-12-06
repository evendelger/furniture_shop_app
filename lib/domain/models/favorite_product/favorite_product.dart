import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

part 'favorite_product.freezed.dart';

@freezed
class FavoriteProduct with _$FavoriteProduct {
  const factory FavoriteProduct({
    required ProductPreview product,
    required bool isInCart,
  }) = _FavoriteProduct;
}
