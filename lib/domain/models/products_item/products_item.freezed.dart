// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductsItem {
  ProductPreview get product => throw _privateConstructorUsedError;
  bool get isInCart => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductsItemCopyWith<ProductsItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsItemCopyWith<$Res> {
  factory $ProductsItemCopyWith(
          ProductsItem value, $Res Function(ProductsItem) then) =
      _$ProductsItemCopyWithImpl<$Res, ProductsItem>;
  @useResult
  $Res call({ProductPreview product, bool isInCart});

  $ProductPreviewCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductsItemCopyWithImpl<$Res, $Val extends ProductsItem>
    implements $ProductsItemCopyWith<$Res> {
  _$ProductsItemCopyWithImpl(this._value, this._then);

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
abstract class _$$ProductsItemImplCopyWith<$Res>
    implements $ProductsItemCopyWith<$Res> {
  factory _$$ProductsItemImplCopyWith(
          _$ProductsItemImpl value, $Res Function(_$ProductsItemImpl) then) =
      __$$ProductsItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductPreview product, bool isInCart});

  @override
  $ProductPreviewCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductsItemImplCopyWithImpl<$Res>
    extends _$ProductsItemCopyWithImpl<$Res, _$ProductsItemImpl>
    implements _$$ProductsItemImplCopyWith<$Res> {
  __$$ProductsItemImplCopyWithImpl(
      _$ProductsItemImpl _value, $Res Function(_$ProductsItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? isInCart = null,
  }) {
    return _then(_$ProductsItemImpl(
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

class _$ProductsItemImpl implements _ProductsItem {
  const _$ProductsItemImpl({required this.product, required this.isInCart});

  @override
  final ProductPreview product;
  @override
  final bool isInCart;

  @override
  String toString() {
    return 'ProductsItem(product: $product, isInCart: $isInCart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsItemImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.isInCart, isInCart) ||
                other.isInCart == isInCart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, isInCart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsItemImplCopyWith<_$ProductsItemImpl> get copyWith =>
      __$$ProductsItemImplCopyWithImpl<_$ProductsItemImpl>(this, _$identity);
}

abstract class _ProductsItem implements ProductsItem {
  const factory _ProductsItem(
      {required final ProductPreview product,
      required final bool isInCart}) = _$ProductsItemImpl;

  @override
  ProductPreview get product;
  @override
  bool get isInCart;
  @override
  @JsonKey(ignore: true)
  _$$ProductsItemImplCopyWith<_$ProductsItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
