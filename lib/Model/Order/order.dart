
import 'package:admin_app/Model/RestaurantMenu/restaurantMenu.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    int? orderNo,
    String? orderStatus,
    int? tableNo,
    List<RestaurantMenu>? items,
    String? customerName,
    double? price,
    Map<String,int>? quanntity,
    double? tax,
    double? discount,
    String? contactNo,
    double? totalPrice,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
