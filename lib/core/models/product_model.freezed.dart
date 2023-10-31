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
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  BusinessModel? get business => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get info => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  List<dynamic> get images => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
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
      {@JsonKey(name: '_id') String id,
      BusinessModel? business,
      String name,
      String info,
      String category,
      List<dynamic> images,
      double price,
      String createdAt,
      String updatedAt,
      bool isStoreVerified,
      bool isStoreFavorite});

  $BusinessModelCopyWith<$Res>? get business;
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
    Object? id = null,
    Object? business = freezed,
    Object? name = null,
    Object? info = null,
    Object? category = null,
    Object? images = null,
    Object? price = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isStoreVerified = null,
    Object? isStoreFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessModel?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $BusinessModelCopyWith<$Res>? get business {
    if (_value.business == null) {
      return null;
    }

    return $BusinessModelCopyWith<$Res>(_value.business!, (value) {
      return _then(_value.copyWith(business: value) as $Val);
    });
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
      {@JsonKey(name: '_id') String id,
      BusinessModel? business,
      String name,
      String info,
      String category,
      List<dynamic> images,
      double price,
      String createdAt,
      String updatedAt,
      bool isStoreVerified,
      bool isStoreFavorite});

  @override
  $BusinessModelCopyWith<$Res>? get business;
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
    Object? id = null,
    Object? business = freezed,
    Object? name = null,
    Object? info = null,
    Object? category = null,
    Object? images = null,
    Object? price = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isStoreVerified = null,
    Object? isStoreFavorite = null,
  }) {
    return _then(_$_ProductModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      business: freezed == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as BusinessModel?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: '_id') this.id = '',
      this.business = null,
      this.name = '',
      this.info = '',
      this.category = '',
      final List<dynamic> images = const [],
      this.price = 0,
      this.createdAt = '',
      this.updatedAt = '',
      this.isStoreVerified = false,
      this.isStoreFavorite = false})
      : _images = images;

  factory _$_ProductModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey()
  final BusinessModel? business;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String info;
  @override
  @JsonKey()
  final String category;
  final List<dynamic> _images;
  @override
  @JsonKey()
  List<dynamic> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String updatedAt;
  @override
  @JsonKey()
  final bool isStoreVerified;
  @override
  @JsonKey()
  final bool isStoreFavorite;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductModel(id: $id, business: $business, name: $name, info: $info, category: $category, images: $images, price: $price, createdAt: $createdAt, updatedAt: $updatedAt, isStoreVerified: $isStoreVerified, isStoreFavorite: $isStoreFavorite)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('business', business))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('info', info))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('images', images))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('isStoreVerified', isStoreVerified))
      ..add(DiagnosticsProperty('isStoreFavorite', isStoreFavorite));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isStoreVerified, isStoreVerified) ||
                other.isStoreVerified == isStoreVerified) &&
            (identical(other.isStoreFavorite, isStoreFavorite) ||
                other.isStoreFavorite == isStoreFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      business,
      name,
      info,
      category,
      const DeepCollectionEquality().hash(_images),
      price,
      createdAt,
      updatedAt,
      isStoreVerified,
      isStoreFavorite);

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
      {@JsonKey(name: '_id') final String id,
      final BusinessModel? business,
      final String name,
      final String info,
      final String category,
      final List<dynamic> images,
      final double price,
      final String createdAt,
      final String updatedAt,
      final bool isStoreVerified,
      final bool isStoreFavorite}) = _$_ProductModel;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$_ProductModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  BusinessModel? get business;
  @override
  String get name;
  @override
  String get info;
  @override
  String get category;
  @override
  List<dynamic> get images;
  @override
  double get price;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  bool get isStoreVerified;
  @override
  bool get isStoreFavorite;
  @override
  @JsonKey(ignore: true)
  _$$_ProductModelCopyWith<_$_ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductCategoryModel _$ProductCategoryModelFromJson(Map<String, dynamic> json) {
  return _ProductCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$ProductCategoryModel {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: '__v')
  int get v => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCategoryModelCopyWith<ProductCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoryModelCopyWith<$Res> {
  factory $ProductCategoryModelCopyWith(ProductCategoryModel value,
          $Res Function(ProductCategoryModel) then) =
      _$ProductCategoryModelCopyWithImpl<$Res, ProductCategoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: '__v') int v,
      String name,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class _$ProductCategoryModelCopyWithImpl<$Res,
        $Val extends ProductCategoryModel>
    implements $ProductCategoryModelCopyWith<$Res> {
  _$ProductCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? v = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductCategoryModelCopyWith<$Res>
    implements $ProductCategoryModelCopyWith<$Res> {
  factory _$$_ProductCategoryModelCopyWith(_$_ProductCategoryModel value,
          $Res Function(_$_ProductCategoryModel) then) =
      __$$_ProductCategoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String id,
      @JsonKey(name: '__v') int v,
      String name,
      String createdAt,
      String updatedAt});
}

/// @nodoc
class __$$_ProductCategoryModelCopyWithImpl<$Res>
    extends _$ProductCategoryModelCopyWithImpl<$Res, _$_ProductCategoryModel>
    implements _$$_ProductCategoryModelCopyWith<$Res> {
  __$$_ProductCategoryModelCopyWithImpl(_$_ProductCategoryModel _value,
      $Res Function(_$_ProductCategoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? v = null,
    Object? name = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_ProductCategoryModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      v: null == v
          ? _value.v
          : v // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductCategoryModel
    with DiagnosticableTreeMixin
    implements _ProductCategoryModel {
  _$_ProductCategoryModel(
      {@JsonKey(name: '_id') this.id = '',
      @JsonKey(name: '__v') this.v = 0,
      this.name = '',
      this.createdAt = '',
      this.updatedAt = ''});

  factory _$_ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProductCategoryModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: '__v')
  final int v;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String createdAt;
  @override
  @JsonKey()
  final String updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductCategoryModel(id: $id, v: $v, name: $name, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductCategoryModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('v', v))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.v, v) || other.v == v) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, v, name, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductCategoryModelCopyWith<_$_ProductCategoryModel> get copyWith =>
      __$$_ProductCategoryModelCopyWithImpl<_$_ProductCategoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductCategoryModelToJson(
      this,
    );
  }
}

abstract class _ProductCategoryModel implements ProductCategoryModel {
  factory _ProductCategoryModel(
      {@JsonKey(name: '_id') final String id,
      @JsonKey(name: '__v') final int v,
      final String name,
      final String createdAt,
      final String updatedAt}) = _$_ProductCategoryModel;

  factory _ProductCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_ProductCategoryModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: '__v')
  int get v;
  @override
  String get name;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ProductCategoryModelCopyWith<_$_ProductCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
