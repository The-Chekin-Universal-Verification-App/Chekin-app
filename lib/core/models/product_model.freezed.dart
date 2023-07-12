// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  String get productImage => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get luxCode => throw _privateConstructorUsedError;
  bool get isStoreVerified => throw _privateConstructorUsedError;
  bool get isStoreFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {String productImage,
      String itemName,
      String storeName,
      String price,
      String desc,
      String luxCode,
      bool isStoreVerified,
      bool isStoreFavorite});
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImage = null,
    Object? itemName = null,
    Object? storeName = null,
    Object? price = null,
    Object? desc = null,
    Object? luxCode = null,
    Object? isStoreVerified = null,
    Object? isStoreFavorite = null,
  }) {
    return _then(_value.copyWith(
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      luxCode: null == luxCode
          ? _value.luxCode
          : luxCode // ignore: cast_nullable_to_non_nullable
              as String,
      isStoreVerified: null == isStoreVerified
          ? _value.isStoreVerified
          : isStoreVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isStoreFavorite: null == isStoreFavorite
          ? _value.isStoreFavorite
          : isStoreFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$_ProductModelCopyWith(
          _$_ProductModel value, $Res Function(_$_ProductModel) then) =
      __$$_ProductModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productImage,
      String itemName,
      String storeName,
      String price,
      String desc,
      String luxCode,
      bool isStoreVerified,
      bool isStoreFavorite});
}

/// @nodoc
class __$$_ProductModelCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$_ProductModel>
    implements _$$_ProductModelCopyWith<$Res> {
  __$$_ProductModelCopyWithImpl(
      _$_ProductModel _value, $Res Function(_$_ProductModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImage = null,
    Object? itemName = null,
    Object? storeName = null,
    Object? price = null,
    Object? desc = null,
    Object? luxCode = null,
    Object? isStoreVerified = null,
    Object? isStoreFavorite = null,
  }) {
    return _then(_$_ProductModel(
      productImage: null == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      luxCode: null == luxCode
          ? _value.luxCode
          : luxCode // ignore: cast_nullable_to_non_nullable
              as String,
      isStoreVerified: null == isStoreVerified
          ? _value.isStoreVerified
          : isStoreVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isStoreFavorite: null == isStoreFavorite
          ? _value.isStoreFavorite
          : isStoreFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductModel with DiagnosticableTreeMixin implements _ProductModel {
  _$_ProductModel(
      {this.productImage = '',
      this.itemName = '',
      this.storeName = '',
      this.price = '',
      this.desc = '',
      this.luxCode = '',
      this.isStoreVerified = false,
      this.isStoreFavorite = false});

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  @JsonKey()
  final String productImage;
  @override
  @JsonKey()
  final String itemName;
  @override
  @JsonKey()
  final String storeName;
  @override
  @JsonKey()
  final String price;
  @override
  @JsonKey()
  final String desc;
  @override
  @JsonKey()
  final String luxCode;
  @override
  @JsonKey()
  final bool isStoreVerified;
  @override
  @JsonKey()
  final bool isStoreFavorite;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductModel(productImage: $productImage, itemName: $itemName, storeName: $storeName, price: $price, desc: $desc, luxCode: $luxCode, isStoreVerified: $isStoreVerified, isStoreFavorite: $isStoreFavorite)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductModel'))
      ..add(DiagnosticsProperty('productImage', productImage))
      ..add(DiagnosticsProperty('itemName', itemName))
      ..add(DiagnosticsProperty('storeName', storeName))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('desc', desc))
      ..add(DiagnosticsProperty('luxCode', luxCode))
      ..add(DiagnosticsProperty('isStoreVerified', isStoreVerified))
      ..add(DiagnosticsProperty('isStoreFavorite', isStoreFavorite));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.luxCode, luxCode) || other.luxCode == luxCode) &&
            (identical(other.isStoreVerified, isStoreVerified) ||
                other.isStoreVerified == isStoreVerified) &&
            (identical(other.isStoreFavorite, isStoreFavorite) ||
                other.isStoreFavorite == isStoreFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productImage, itemName,
      storeName, price, desc, luxCode, isStoreVerified, isStoreFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      __$$_ProductModelCopyWithImpl<_$_ProductModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductModelToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  factory _ProductModel(
      {final String productImage,
      final String itemName,
      final String storeName,
      final String price,
      final String desc,
      final String luxCode,
      final bool isStoreVerified,
      final bool isStoreFavorite}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  String get productImage;
  @override
  String get itemName;
  @override
  String get storeName;
  @override
  String get price;
  @override
  String get desc;
  @override
  String get luxCode;
  @override
  bool get isStoreVerified;
  @override
  bool get isStoreFavorite;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}
