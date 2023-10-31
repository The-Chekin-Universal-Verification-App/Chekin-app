import 'package:chekinapp/export.dart';

part 'sign_in_model.freezed.dart';

part 'sign_in_model.g.dart';

@freezed
class SignInModel with _$SignInModel {
  factory SignInModel({
    @Default('') String email,
    @Default('') String password,
  }) = _SignInModel;

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);

  static SignInModel init() {
    return SignInModel(email: '', password: '');
  }
}
