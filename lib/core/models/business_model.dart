import 'package:chekinapp/export.dart';

part 'business_model.freezed.dart';

part 'business_model.g.dart';

@freezed
class BusinessModel with _$BusinessModel {
  factory BusinessModel({
    @Default('') @JsonKey(name: '_id') String id,
    @Default(0) @JsonKey(name: '__v') int v,
    @Default('') String owner,
    @Default('') String name,
    @Default('') String description,
    @Default('') String lga,
    @Default('') String state,
    @Default('') String city,
    @Default('') String nearestLandmark,
    @Default('') String dateEstablished,
    @Default('') String phoneNumber1,
    @Default('') String phoneNumber2,
    @Default('') String email1,
    @Default('') String email2,
    @Default('') String instagram,
    @Default('') String twitter,
    @Default('') String facebook,
    @Default('') String tiktok,
    @Default('') String linkedIn,
    @Default(false) bool verified,
    @Default('') String paymentOption,
    @Default(false) bool isActive,
    @Default('') dynamic currentSubscription,
    @Default('') String businessImage,
    @Default('') String luxCode,
  }) = _BusinessModel;

  factory BusinessModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessModelFromJson(json);

  static BusinessModel init() {
    return BusinessModel(name: '', nearestLandmark: '', lga: '');
  }
}

@freezed
class MakeBusinessReviewModel with _$MakeBusinessReviewModel {
  factory MakeBusinessReviewModel({
    @Default('') String rating,
    @Default('') String review,
  }) = _MakeBusinessReviewModel;

  factory MakeBusinessReviewModel.fromJson(Map<String, dynamic> json) =>
      _$MakeBusinessReviewModelFromJson(json);

  static MakeBusinessReviewModel init() {
    return MakeBusinessReviewModel(rating: '', review: '');
  }
}

@freezed
class BusinessDocUploadModel with _$BusinessDocUploadModel {
  factory BusinessDocUploadModel({
    @Default(false) bool idUpload,
    @Default(false) bool utility,
    @Default(false) bool instagramWhenLoggedIn,
    @Default(false) bool facebookWhenLoggedIn,
    @Default(false) bool selfieHoldingId,
  }) = _BusinessDocUploadModel;

  factory BusinessDocUploadModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessDocUploadModelFromJson(json);

  static BusinessDocUploadModel init() {
    return BusinessDocUploadModel(
      selfieHoldingId: false,
    );
  }
}
