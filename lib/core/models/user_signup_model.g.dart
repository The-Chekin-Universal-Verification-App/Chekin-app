// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSignUpModel _$$_UserSignUpModelFromJson(Map<String, dynamic> json) =>
    _$_UserSignUpModel(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      middleName: json['middleName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      nationality: json['nationality'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserSignUpModelToJson(_$_UserSignUpModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'nationality': instance.nationality,
      'phoneNumber': instance.phoneNumber,
    };
