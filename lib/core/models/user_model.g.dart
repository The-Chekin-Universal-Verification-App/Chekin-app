// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      middleName: json['middleName'] as String? ?? '',
      nationality: json['nationality'] as String? ?? '',
      profileImageUrl: json['profileImageUrl'] as String? ?? '',
      email: json['email'] as String? ?? '',
      role: json['role'] as String? ?? '',
      verified: json['verified'] as bool? ?? false,
      phoneNumber: json['phoneNumber'] as String? ?? '',
      business: json['business'] ?? null,
      id: json['_id'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'middleName': instance.middleName,
      'nationality': instance.nationality,
      'profileImageUrl': instance.profileImageUrl,
      'email': instance.email,
      'role': instance.role,
      'verified': instance.verified,
      'phoneNumber': instance.phoneNumber,
      'business': instance.business,
      '_id': instance.id,
    };

_$_WalletModel _$$_WalletModelFromJson(Map<String, dynamic> json) =>
    _$_WalletModel(
      balance: json['balance'] as String? ?? '',
      debits: json['debits'] as String? ?? '',
      credits: json['credits'] as String? ?? '',
      referral_earnings: json['referral_earnings'] as String? ?? '',
      fund_from_admin: json['fund_from_admin'] as String? ?? '',
      transaction_count: json['transaction_count'] as String? ?? '',
    );

Map<String, dynamic> _$$_WalletModelToJson(_$_WalletModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'debits': instance.debits,
      'credits': instance.credits,
      'referral_earnings': instance.referral_earnings,
      'fund_from_admin': instance.fund_from_admin,
      'transaction_count': instance.transaction_count,
    };
