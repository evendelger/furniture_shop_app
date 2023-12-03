import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String id,
    required String title,
    required double price,
    required String image,
    required double rating,
    required int reviews,
    required String type,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);

  factory Product.fromDbModel(CartDBProduct dbModel) {
    return Product(
      id: dbModel.id,
      title: dbModel.title,
      price: dbModel.price,
      image: dbModel.image,
      rating: dbModel.rating,
      reviews: dbModel.reviews,
      type: dbModel.type,
    );
  }
}
