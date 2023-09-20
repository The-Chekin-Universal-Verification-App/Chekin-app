// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      id: json['_id'] as String? ?? '',
      business: json['business'] == null
          ? null
          : BusinessModel.fromJson(json['business'] as Map<String, dynamic>),
      name: json['name'] as String? ?? '',
      info: json['info'] as String? ?? '',
      category: json['category'] as String? ?? '',
      images: json['images'] as List<dynamic>? ?? const [],
      price: (json['price'] as num?)?.toDouble() ?? 0,
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      isStoreVerified: json['isStoreVerified'] as bool? ?? false,
      isStoreFavorite: json['isStoreFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'business': instance.business,
      'name': instance.name,
      'info': instance.info,
      'category': instance.category,
      'images': instance.images,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isStoreVerified': instance.isStoreVerified,
      'isStoreFavorite': instance.isStoreFavorite,
    };
