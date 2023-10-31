// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EmailVerificationModel _$$_EmailVerificationModelFromJson(
        Map<String, dynamic> json) =>
    _$_EmailVerificationModel(
      email: json['email'] as String? ?? '',
      code: json['code'] as String? ?? '',
    );

Map<String, dynamic> _$$_EmailVerificationModelToJson(
        _$_EmailVerificationModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
    };
