import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurantMenu.freezed.dart';
part 'restaurantMenu.g.dart';

@freezed
class RestaurantMenu with _$RestaurantMenu {
  const factory RestaurantMenu({
    String? code,
    String? name,
    String? itemType,
    String? description,
    String? image,
    @Default(0) int? tax,
    @Default(0) int? discount,
    int? price,
    List<String>? tags,
    @Default(0) int itemCount,
    List<String>? recommendedWith,
    String? category,
  }) = _RestaurantMenu;

  factory RestaurantMenu.fromJson(Map<String, dynamic> json) =>
      _$RestaurantMenuFromJson(json);
}
