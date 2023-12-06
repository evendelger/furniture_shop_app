// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteProduct {
  ProductPreview get product => throw _privateConstructorUsedError;
  bool get isInCart => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteProductCopyWith<FavoriteProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteProductCopyWith<$Res> {
  factory $FavoriteProductCopyWith(
          FavoriteProduct value, $Res Function(FavoriteProduct) then) =
      _$FavoriteProductCopyWithImpl<$Res, FavoriteProduct>;
  @useResult
  $Res call({ProductPreview product, bool isInCart});

  $ProductPreviewCopyWith<$Res> get product;
}

/// @nodoc
class _$FavoriteProductCopyWithImpl<$Res, $Val extends FavoriteProduct>
    implements $FavoriteProductCopyWith<$Res> {
  _$FavoriteProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? isInCart = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductPreview,
      isInCart: null == isInCart
          ? _value.isInCart
          : isInCart // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductPreviewCopyWith<$Res> get product {
    return $ProductPreviewCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FavoriteProductImplCopyWith<$Res>
    implements $FavoriteProductCopyWith<$Res> {
  factory _$$FavoriteProductImplCopyWith(_$FavoriteProductImpl value,
          $Res Function(_$FavoriteProductImpl) then) =
      __$$FavoriteProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductPreview product, bool isInCart});

  @override
  $ProductPreviewCopyWith<$Res> get product;
}

/// @nodoc
class __$$FavoriteProductImplCopyWithImpl<$Res>
    extends _$FavoriteProductCopyWithImpl<$Res, _$FavoriteProductImpl>
    implements _$$FavoriteProductImplCopyWith<$Res> {
  __$$FavoriteProductImplCopyWithImpl(
      _$FavoriteProductImpl _value, $Res Function(_$FavoriteProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? isInCart = null,
  }) {
    return _then(_$FavoriteProductImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductPreview,
      isInCart: null == isInCart
          ? _value.isInCart
          : isInCart // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FavoriteProductImpl implements _FavoriteProduct {
  const _$FavoriteProductImpl({required this.product, required this.isInCart});

  @override
  final ProductPreview product;
  @override
  final bool isInCart;

  @override
  String toString() {
    return 'FavoriteProduct(product: $product, isInCart: $isInCart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteProductImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.isInCart, isInCart) ||
                other.isInCart == isInCart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, isInCart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteProductImplCopyWith<_$FavoriteProductImpl> get copyWith =>
      __$$FavoriteProductImplCopyWithImpl<_$FavoriteProductImpl>(
          this, _$identity);
}

abstract class _FavoriteProduct implements FavoriteProduct {
  const factory _FavoriteProduct(
      {required final ProductPreview product,
      required final bool isInCart}) = _$FavoriteProductImpl;

  @override
  ProductPreview get product;
  @override
  bool get isInCart;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteProductImplCopyWith<_$FavoriteProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
