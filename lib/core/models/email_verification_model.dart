import 'package:chekinapp/export.dart';

part 'email_verification_model.freezed.dart';

part 'email_verification_model.g.dart';

@freezed
class EmailVerificationModel with _$EmailVerificationModel {
  factory EmailVerificationModel({
    @Default('') String email,
    @Default('') String code,
  }) = _EmailVerificationModel;

  factory EmailVerificationModel.fromJson(Map<String, dynamic> json) =>
      _$EmailVerificationModelFromJson(json);

  static EmailVerificationModel init() {
    return EmailVerificationModel(email: '', code: '');
  }
}
