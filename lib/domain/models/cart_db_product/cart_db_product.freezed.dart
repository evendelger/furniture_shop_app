// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_db_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartDBProduct _$CartDBProductFromJson(Map<String, dynamic> json) {
  return _CartDBProduct.fromJson(json);
}

/// @nodoc
mixin _$CartDBProduct {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get reviews => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartDBProductCopyWith<CartDBProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartDBProductCopyWith<$Res> {
  factory $CartDBProductCopyWith(
          CartDBProduct value, $Res Function(CartDBProduct) then) =
      _$CartDBProductCopyWithImpl<$Res, CartDBProduct>;
  @useResult
  $Res call(
      {String id,
      String title,
      double price,
      String image,
      double rating,
      int reviews,
      int quantity});
}

/// @nodoc
class _$CartDBProductCopyWithImpl<$Res, $Val extends CartDBProduct>
    implements $CartDBProductCopyWith<$Res> {
  _$CartDBProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? image = null,
    Object? rating = null,
    Object? reviews = null,
    Object? quantity = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartDBProductImplCopyWith<$Res>
    implements $CartDBProductCopyWith<$Res> {
  factory _$$CartDBProductImplCopyWith(
          _$CartDBProductImpl value, $Res Function(_$CartDBProductImpl) then) =
      __$$CartDBProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      double price,
      String image,
      double rating,
      int reviews,
      int quantity});
}

/// @nodoc
class __$$CartDBProductImplCopyWithImpl<$Res>
    extends _$CartDBProductCopyWithImpl<$Res, _$CartDBProductImpl>
    implements _$$CartDBProductImplCopyWith<$Res> {
  __$$CartDBProductImplCopyWithImpl(
      _$CartDBProductImpl _value, $Res Function(_$CartDBProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? image = null,
    Object? rating = null,
    Object? reviews = null,
    Object? quantity = null,
  }) {
    return _then(_$CartDBProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartDBProductImpl implements _CartDBProduct {
  const _$CartDBProductImpl(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.rating,
      required this.reviews,
      required this.quantity});

  factory _$CartDBProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartDBProductImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final double price;
  @override
  final String image;
  @override
  final double rating;
  @override
  final int reviews;
  @override
  final int quantity;

  @override
  String toString() {
    return 'CartDBProduct(id: $id, title: $title, price: $price, image: $image, rating: $rating, reviews: $reviews, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartDBProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviews, reviews) || other.reviews == reviews) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, price, image, rating, reviews, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartDBProductImplCopyWith<_$CartDBProductImpl> get copyWith =>
      __$$CartDBProductImplCopyWithImpl<_$CartDBProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartDBProductImplToJson(
      this,
    );
  }
}

abstract class _CartDBProduct implements CartDBProduct {
  const factory _CartDBProduct(
      {required final String id,
      required final String title,
      required final double price,
      required final String image,
      required final double rating,
      required final int reviews,
      required final int quantity}) = _$CartDBProductImpl;

  factory _CartDBProduct.fromJson(Map<String, dynamic> json) =
      _$CartDBProductImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  double get price;
  @override
  String get image;
  @override
  double get rating;
  @override
  int get reviews;
  @override
  int get quantity;
  @override
  @JsonKey(ignore: true)
  _$$CartDBProductImplCopyWith<_$CartDBProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
