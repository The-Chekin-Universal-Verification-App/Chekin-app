import 'package:chekinapp/export.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    @Default('') String productImage,
    @Default('') String itemName,
    @Default('') String storeName,
    @Default('') String price,
    @Default('') String desc,
    @Default('') String luxCode,
    @Default(false) bool isStoreVerified,
    @Default(false) bool isStoreFavorite,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  static ProductModel init() {
    return ProductModel(itemName: '', storeName: '');
  }
}
