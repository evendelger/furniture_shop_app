// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductPreview _$ProductPreviewFromJson(Map<String, dynamic> json) {
  return _ProductPreview.fromJson(json);
}

/// @nodoc
mixin _$ProductPreview {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductPreviewCopyWith<ProductPreview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPreviewCopyWith<$Res> {
  factory $ProductPreviewCopyWith(
          ProductPreview value, $Res Function(ProductPreview) then) =
      _$ProductPreviewCopyWithImpl<$Res, ProductPreview>;
  @useResult
  $Res call({String id, String title, double price, String image});
}

/// @nodoc
class _$ProductPreviewCopyWithImpl<$Res, $Val extends ProductPreview>
    implements $ProductPreviewCopyWith<$Res> {
  _$ProductPreviewCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPreviewImplCopyWith<$Res>
    implements $ProductPreviewCopyWith<$Res> {
  factory _$$ProductPreviewImplCopyWith(_$ProductPreviewImpl value,
          $Res Function(_$ProductPreviewImpl) then) =
      __$$ProductPreviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, double price, String image});
}

/// @nodoc
class __$$ProductPreviewImplCopyWithImpl<$Res>
    extends _$ProductPreviewCopyWithImpl<$Res, _$ProductPreviewImpl>
    implements _$$ProductPreviewImplCopyWith<$Res> {
  __$$ProductPreviewImplCopyWithImpl(
      _$ProductPreviewImpl _value, $Res Function(_$ProductPreviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? image = null,
  }) {
    return _then(_$ProductPreviewImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductPreviewImpl implements _ProductPreview {
  const _$ProductPreviewImpl(
      {required this.id,
      required this.title,
      required this.price,
      required this.image});

  factory _$ProductPreviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductPreviewImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final double price;
  @override
  final String image;

  @override
  String toString() {
    return 'ProductPreview(id: $id, title: $title, price: $price, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPreviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, price, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPreviewImplCopyWith<_$ProductPreviewImpl> get copyWith =>
      __$$ProductPreviewImplCopyWithImpl<_$ProductPreviewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPreviewImplToJson(
      this,
    );
  }
}

abstract class _ProductPreview implements ProductPreview {
  const factory _ProductPreview(
      {required final String id,
      required final String title,
      required final double price,
      required final String image}) = _$ProductPreviewImpl;

  factory _ProductPreview.fromJson(Map<String, dynamic> json) =
      _$ProductPreviewImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  double get price;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$ProductPreviewImplCopyWith<_$ProductPreviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
