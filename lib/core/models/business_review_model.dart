import 'package:chekinapp/export.dart';

part 'business_review_model.freezed.dart';

part 'business_review_model.g.dart';

@freezed
class BusinessReviewModel with _$BusinessReviewModel {
  factory BusinessReviewModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default(0) @JsonKey(name: '__v') int v,
    @Default('') String business,
    @Default('') String rating,
    @Default('') String user,
    @Default('') String review,
    @Default('') String status,
    @Default('') String createdAt,
    @Default('') String updatedA,
  }) = _BusinessReviewModel;

  factory BusinessReviewModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessReviewModelFromJson(json);

  static BusinessReviewModel init() {
    return BusinessReviewModel(user:'',review:'');
  }
}