import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

part 'product_pv_list.freezed.dart';
part 'product_pv_list.g.dart';

@freezed
class ProductPvList with _$ProductPvList {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory ProductPvList({
    required List<ProductPreview> products,
  }) = _ProductPvList;

  factory ProductPvList.fromJson(Map<String, Object?> json) =>
      _$ProductPvListFromJson(json);
}
