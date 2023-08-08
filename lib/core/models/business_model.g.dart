// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BusinessModel _$$_BusinessModelFromJson(Map<String, dynamic> json) =>
    _$_BusinessModel(
      id: json['_id'] as String? ?? '',
      owner: json['owner'] as String? ?? '',
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      lga: json['lga'] as String? ?? '',
      state: json['state'] as String? ?? '',
      city: json['city'] as String? ?? '',
      nearestLandmark: json['nearestLandmark'] as String? ?? '',
      dateEstablished: json['dateEstablished'] as String? ?? '',
      phoneNumber1: json['phoneNumber1'] as String? ?? '',
      phoneNumber2: json['phoneNumber2'] as String? ?? '',
      email1: json['email1'] as String? ?? '',
      email2: json['email2'] as String? ?? '',
      instagram: json['instagram'] as String? ?? '',
      twitter: json['twitter'] as String? ?? '',
      facebook: json['facebook'] as String? ?? '',
      tiktok: json['tiktok'] as String? ?? '',
      linkedIn: json['linkedIn'] as String? ?? '',
      verified: json['verified'] as bool? ?? false,
      paymentOption: json['paymentOption'] as String? ?? '',
      isActive: json['isActive'] as bool? ?? false,
      currentSubscription: json['currentSubscription'] as String? ?? '',
      luxCode: json['luxCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_BusinessModelToJson(_$_BusinessModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'owner': instance.owner,
      'name': instance.name,
      'description': instance.description,
      'lga': instance.lga,
      'state': instance.state,
      'city': instance.city,
      'nearestLandmark': instance.nearestLandmark,
      'dateEstablished': instance.dateEstablished,
      'phoneNumber1': instance.phoneNumber1,
      'phoneNumber2': instance.phoneNumber2,
      'email1': instance.email1,
      'email2': instance.email2,
      'instagram': instance.instagram,
      'twitter': instance.twitter,
      'facebook': instance.facebook,
      'tiktok': instance.tiktok,
      'linkedIn': instance.linkedIn,
      'verified': instance.verified,
      'paymentOption': instance.paymentOption,
      'isActive': instance.isActive,
      'currentSubscription': instance.currentSubscription,
      'luxCode': instance.luxCode,
    };
