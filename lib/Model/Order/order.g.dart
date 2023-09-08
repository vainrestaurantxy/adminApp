// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      orderNo: json['orderNo'] as int?,
      orderStatus: json['orderStatus'] as String?,
      tableNo: json['tableNo'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => RestaurantMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerName: json['customerName'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      quanntity: (json['quanntity'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
      tax: (json['tax'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      contactNo: json['contactNo'] as String?,
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'orderNo': instance.orderNo,
      'orderStatus': instance.orderStatus,
      'tableNo': instance.tableNo,
      'items': instance.items,
      'customerName': instance.customerName,
      'price': instance.price,
      'quanntity': instance.quanntity,
      'tax': instance.tax,
      'discount': instance.discount,
      'contactNo': instance.contactNo,
      'totalPrice': instance.totalPrice,
    };
