import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem {
  const CartItem({
    required this.id,
    this.value = 1,
  });

  final String id;
  final int? value;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
