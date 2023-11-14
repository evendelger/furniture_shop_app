import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_db_product.freezed.dart';
part 'cart_db_product.g.dart';

@freezed
class CartDBProduct with _$CartDBProduct {
  const factory CartDBProduct({
    required String id,
    required String title,
    required double price,
    required String image,
    required double rating,
    required int reviews,
    required int quantity,
  }) = _CartDBProduct;

  factory CartDBProduct.fromJson(Map<String, Object?> json) =>
      _$CartDBProductFromJson(json);
}
