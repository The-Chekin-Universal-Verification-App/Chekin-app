// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      image: json['image'] as String? ?? '',
      phone_number: json['phone_number'] as String? ?? '',
      referral_code: json['referral_code'] as String? ?? '',
      email_verified_at: json['email_verified_at'] as String? ?? '',
      created_at: json['created_at'] as String? ?? '',
      updated_at: json['updated_at'] as String? ?? '',
      accountId: json['accountId'] as String? ?? '',
      referral_link: json['referral_link'] as String? ?? '',
      account_id: json['account_id'] as String? ?? '',
      wallet_balance: json['wallet_balance'] as String? ?? '',
      referral_count: json['referral_count'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      bank_accounts: (json['bank_accounts'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      meta: json['meta'] as Map<String, dynamic>? ?? const {},
      wallet: json['wallet'] as Map<String, dynamic>? ?? const {},
      referral: json['referral'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'image': instance.image,
      'phone_number': instance.phone_number,
      'referral_code': instance.referral_code,
      'email_verified_at': instance.email_verified_at,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'accountId': instance.accountId,
      'referral_link': instance.referral_link,
      'account_id': instance.account_id,
      'wallet_balance': instance.wallet_balance,
      'referral_count': instance.referral_count,
      'id': instance.id,
      'bank_accounts': instance.bank_accounts,
      'meta': instance.meta,
      'wallet': instance.wallet,
      'referral': instance.referral,
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
