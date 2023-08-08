import 'package:chekinapp/export.dart';

part 'reset_password_model.freezed.dart';

part 'reset_password_model.g.dart';

@freezed
class ResetPasswordModel with _$ResetPasswordModel {
  factory ResetPasswordModel({
    @Default('') String email,
    @Default('') String code,
    @Default('') String password,
  }) = _ResetPasswordModel;

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordModelFromJson(json);

  static ResetPasswordModel init() {
    return ResetPasswordModel(email: '', code: '');
  }
}
