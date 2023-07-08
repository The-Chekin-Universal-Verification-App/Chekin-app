// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModel _$$_ProductModelFromJson(Map<String, dynamic> json) =>
    _$_ProductModel(
      productImage: json['productImage'] as String? ?? '',
      itemName: json['itemName'] as String? ?? '',
      storeName: json['storeName'] as String? ?? '',
    );

Map<String, dynamic> _$$_ProductModelToJson(_$_ProductModel instance) =>
    <String, dynamic>{
      'productImage': instance.productImage,
      'itemName': instance.itemName,
      'storeName': instance.storeName,
    };
