// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BusinessReviewModel _$$_BusinessReviewModelFromJson(
        Map<String, dynamic> json) =>
    _$_BusinessReviewModel(
      id: json['_id'] as String? ?? '',
      v: json['__v'] as int? ?? 0,
      business: json['business'] as String? ?? '',
      rating: json['rating'] as String? ?? '',
      user: json['user'] as String? ?? '',
      review: json['review'] as String? ?? '',
      status: json['status'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      updatedA: json['updatedA'] as String? ?? '',
    );

Map<String, dynamic> _$$_BusinessReviewModelToJson(
        _$_BusinessReviewModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      '__v': instance.v,
      'business': instance.business,
      'rating': instance.rating,
      'user': instance.user,
      'review': instance.review,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedA': instance.updatedA,
    };
