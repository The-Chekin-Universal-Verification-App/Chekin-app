import 'package:chekinapp/export.dart';

import 'business_model.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default(null) BusinessModel? business,
    @Default('') String name,
    @Default('') String info,
    @Default('') String category,
    @Default([]) List images,
    @Default(0) double price,
    @Default('') String createdAt,
    @Default('') String updatedAt,
    @Default(false) bool isStoreVerified,
    @Default(false) bool isStoreFavorite,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  static ProductModel init() {
    return ProductModel(name: '', info: '');
  }
}

@freezed
class ProductCategoryModel with _$ProductCategoryModel {
  factory ProductCategoryModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default(0) @JsonKey(name: '__v') int v,
    @Default('') String name,
    @Default('') String createdAt,
    @Default('') String updatedAt,
  }) = _ProductCategoryModel;

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);

  static ProductCategoryModel init() {
    return ProductCategoryModel(
      name: '',
    );
  }
}
