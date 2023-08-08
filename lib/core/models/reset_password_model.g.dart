// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResetPasswordModel _$$_ResetPasswordModelFromJson(
        Map<String, dynamic> json) =>
    _$_ResetPasswordModel(
      email: json['email'] as String? ?? '',
      code: json['code'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$$_ResetPasswordModelToJson(
        _$_ResetPasswordModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'code': instance.code,
      'password': instance.password,
    };
