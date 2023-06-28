import 'package:chekinapp/export.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @Default('') String name,
    @Default('') String email,
    @Default('') String image,
    @Default('') String phone_number,
    @Default('') String referral_code,
    @Default('') String email_verified_at,
    @Default('') String created_at,
    @Default('') String updated_at,
    @Default('') String? accountId,
    @Default('') String referral_link,
    @Default('') String account_id,
    @Default('') String wallet_balance,
    @Default(0) int? referral_count,
    @Default(0) int id,
    @Default([]) List<Map<String, dynamic>> bank_accounts,
    @Default({}) Map<String, dynamic>? meta,
    @Default({}) Map<String, dynamic> wallet,
    @Default({}) Map<String, dynamic> referral,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  static UserModel init() {
    return UserModel(
      name: '',
      email: '',
      phone_number: '',
      updated_at: '',
      referral_link: '',
      bank_accounts: [],
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
