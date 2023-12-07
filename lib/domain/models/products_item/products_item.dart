import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

part 'products_item.freezed.dart';

@freezed
class ProductsItem with _$ProductsItem {
  const factory ProductsItem({
    required ProductPreview product,
    required bool isInCart,
  }) = _ProductsItem;
}
