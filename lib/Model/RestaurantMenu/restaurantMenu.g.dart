// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurantMenu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantMenu _$$_RestaurantMenuFromJson(Map<String, dynamic> json) =>
    _$_RestaurantMenu(
      code: json['code'] as String?,
      name: json['name'] as String?,
      itemType: json['itemType'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      tax: json['tax'] as int? ?? 0,
      discount: json['discount'] as int? ?? 0,
      price: json['price'] as int?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      itemCount: json['itemCount'] as int? ?? 0,
      recommendedWith: (json['recommendedWith'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$_RestaurantMenuToJson(_$_RestaurantMenu instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'itemType': instance.itemType,
      'description': instance.description,
      'image': instance.image,
      'tax': instance.tax,
      'discount': instance.discount,
      'price': instance.price,
      'tags': instance.tags,
      'itemCount': instance.itemCount,
      'recommendedWith': instance.recommendedWith,
      'category': instance.category,
    };
