// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_pv_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPvListImpl _$$ProductPvListImplFromJson(Map<String, dynamic> json) =>
    _$ProductPvListImpl(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductPreview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductPvListImplToJson(_$ProductPvListImpl instance) =>
    <String, dynamic>{
      'products': instance.products.map((e) => e.toJson()).toList(),
    };
