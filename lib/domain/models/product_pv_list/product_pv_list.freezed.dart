// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_pv_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductPvList _$ProductPvListFromJson(Map<String, dynamic> json) {
  return _ProductPvList.fromJson(json);
}

/// @nodoc
mixin _$ProductPvList {
  List<ProductPreview> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductPvListCopyWith<ProductPvList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPvListCopyWith<$Res> {
  factory $ProductPvListCopyWith(
          ProductPvList value, $Res Function(ProductPvList) then) =
      _$ProductPvListCopyWithImpl<$Res, ProductPvList>;
  @useResult
  $Res call({List<ProductPreview> products});
}

/// @nodoc
class _$ProductPvListCopyWithImpl<$Res, $Val extends ProductPvList>
    implements $ProductPvListCopyWith<$Res> {
  _$ProductPvListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductPreview>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPvListImplCopyWith<$Res>
    implements $ProductPvListCopyWith<$Res> {
  factory _$$ProductPvListImplCopyWith(
          _$ProductPvListImpl value, $Res Function(_$ProductPvListImpl) then) =
      __$$ProductPvListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductPreview> products});
}

/// @nodoc
class __$$ProductPvListImplCopyWithImpl<$Res>
    extends _$ProductPvListCopyWithImpl<$Res, _$ProductPvListImpl>
    implements _$$ProductPvListImplCopyWith<$Res> {
  __$$ProductPvListImplCopyWithImpl(
      _$ProductPvListImpl _value, $Res Function(_$ProductPvListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ProductPvListImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductPreview>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ProductPvListImpl implements _ProductPvList {
  const _$ProductPvListImpl({required final List<ProductPreview> products})
      : _products = products;

  factory _$ProductPvListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductPvListImplFromJson(json);

  final List<ProductPreview> _products;
  @override
  List<ProductPreview> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductPvList(products: $products)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPvListImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPvListImplCopyWith<_$ProductPvListImpl> get copyWith =>
      __$$ProductPvListImplCopyWithImpl<_$ProductPvListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPvListImplToJson(
      this,
    );
  }
}

abstract class _ProductPvList implements ProductPvList {
  const factory _ProductPvList({required final List<ProductPreview> products}) =
      _$ProductPvListImpl;

  factory _ProductPvList.fromJson(Map<String, dynamic> json) =
      _$ProductPvListImpl.fromJson;

  @override
  List<ProductPreview> get products;
  @override
  @JsonKey(ignore: true)
  _$$ProductPvListImplCopyWith<_$ProductPvListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
