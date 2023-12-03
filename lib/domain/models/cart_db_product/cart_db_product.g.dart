// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_db_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartDBProductImpl _$$CartDBProductImplFromJson(Map<String, dynamic> json) =>
    _$CartDBProductImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      rating: (json['rating'] as num).toDouble(),
      type: json['type'] as String,
      reviews: json['reviews'] as int,
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$$CartDBProductImplToJson(_$CartDBProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'image': instance.image,
      'rating': instance.rating,
      'type': instance.type,
      'reviews': instance.reviews,
      'quantity': instance.quantity,
    };
