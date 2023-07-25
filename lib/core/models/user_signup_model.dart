import 'package:chekinapp/export.dart';

part 'user_signup_model.freezed.dart';

part 'user_signup_model.g.dart';

@freezed
class UserSignUpModel with _$UserSignUpModel {
  factory UserSignUpModel({
    @Default('') String email,
    @Default('') String password,
    @Default('') String firstName,
    @Default('') String middleName,
    @Default('') String lastName,
    @Default('Nigeria') String nationality,
    @Default('') String phoneNumber,
  }) = _UserSignUpModel;

  factory UserSignUpModel.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpModelFromJson(json);

  static UserSignUpModel init() {
    return UserSignUpModel(lastName: '', nationality: '');
  }
}
