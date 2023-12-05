// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartProductImpl _$$CartProductImplFromJson(Map<String, dynamic> json) =>
    _$CartProductImpl(
      product: ProductPreview.fromJson(json['product'] as Map<String, dynamic>),
      inCartValue: json['inCartValue'] as int? ?? 1,
    );

Map<String, dynamic> _$$CartProductImplToJson(_$CartProductImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'inCartValue': instance.inCartValue,
    };
