import 'package:chekinapp/export.dart';

part 'business_signup_model.freezed.dart';

part 'business_signup_model.g.dart';

@freezed
class BusinessSignUpModel with _$BusinessSignUpModel {
  factory BusinessSignUpModel({
    @Default('') String email,
    @Default('') String password,
    @Default('') String firstName,
    @Default('') String middleName,
    @Default('') String lastName,
    @Default('') String nationality,
    @Default('') String phoneNumber,
    @Default('') String state,
    @Default('') String lga,
    @Default('') String businessName,
    @Default('') String businessDescription,
    @Default('') String lgaOfBusiness,
    @Default('') String stateOfBusiness,
    @Default('') String cityOfBusiness,
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
  }) = _BusinessSignUpModel;

  factory BusinessSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$BusinessSignUpModelFromJson(json);

  static BusinessSignUpModel init() {
    return BusinessSignUpModel(lastName: '', nationality: '');
  }
}
