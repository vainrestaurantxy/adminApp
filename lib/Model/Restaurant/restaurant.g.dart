// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Restaurant _$$_RestaurantFromJson(Map<String, dynamic> json) =>
    _$_Restaurant(
      logo: json['logo'] as String?,
      staffKey: json['staffKey'] as String?,
      isRestaurant: json['isRestaurant'] as bool?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      phone: json['phone'] as String?,
      color: json['color'] as String?,
      noTable: json['noTable'] as int? ?? 100,
      tags: json['tags'] as String?,
      menu: (json['menu'] as List<dynamic>?)
          ?.map((e) => RestaurantMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RestaurantToJson(_$_Restaurant instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'staffKey': instance.staffKey,
      'isRestaurant': instance.isRestaurant,
      'name': instance.name,
      'city': instance.city,
      'state': instance.state,
      'phone': instance.phone,
      'color': instance.color,
      'noTable': instance.noTable,
      'tags': instance.tags,
      'menu': instance.menu,
    };
