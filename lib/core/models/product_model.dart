import 'package:chekinapp/export.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default('') String business,
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
