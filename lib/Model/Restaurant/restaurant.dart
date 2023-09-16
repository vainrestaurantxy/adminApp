import 'package:admin_app/Model/RestaurantMenu/restaurantMenu.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant(
      {String? logo,
      String? staffKey,
      bool? isRestaurant,
      required String? name,
      required String? city,
      required String? state,
      required String? phone,
      String? color,
      @Default(100) int? noTable,
      String? tags,
      List<RestaurantMenu>? menu}) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}
