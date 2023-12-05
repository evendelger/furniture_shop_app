// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_preview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductPreviewImpl _$$ProductPreviewImplFromJson(Map<String, dynamic> json) =>
    _$ProductPreviewImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$$ProductPreviewImplToJson(
        _$ProductPreviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'image': instance.image,
    };
