import 'package:chekinapp/export.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel(
      {@Default('') String firstName,
      @Default('') String lastName,
      @Default('') String middleName,
      @Default('') String nationality,
      @Default('') String profileImageUrl,
      @Default('') String email,
      @Default('') String role,
      @Default(false) bool verified,
      @Default('') String phoneNumber,
      @Default(null) dynamic business,
      @Default('') @JsonKey(name: '_id') String id}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  static UserModel init() {
    return UserModel(
      firstName: '',
      email: '',
      lastName: '',
      profileImageUrl: '',
      phoneNumber: '',
    );
  }
}

@freezed
class WalletModel with _$WalletModel {
  factory WalletModel({
    @Default('') String balance,
    @Default('') String debits,
    @Default('') String credits,
    @Default('') String referral_earnings,
    @Default('') String fund_from_admin,
    @Default('') String transaction_count,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);

  static WalletModel init() {
    return WalletModel(
      balance: '',
      debits: '',
      credits: '',
      referral_earnings: '',
      fund_from_admin: '',
      transaction_count: '',
    );
  }
}
