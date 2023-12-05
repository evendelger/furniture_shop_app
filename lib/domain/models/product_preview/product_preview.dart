import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_preview.freezed.dart';
part 'product_preview.g.dart';

@freezed
class ProductPreview with _$ProductPreview {
  const factory ProductPreview({
    required String id,
    required String title,
    required double price,
    required String image,
  }) = _ProductPreview;

  factory ProductPreview.fromJson(Map<String, Object?> json) =>
      _$ProductPreviewFromJson(json);
}
