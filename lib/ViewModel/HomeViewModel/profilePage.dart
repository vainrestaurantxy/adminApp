import 'package:admin_app/Data/Repositories/DatabaseConnection.dart';
import 'package:admin_app/Data/Repositories/FirebaseConnection.dart';
import 'package:admin_app/Model/Restaurant/restaurant.dart';
import 'package:admin_app/Model/RestaurantMenu/restaurantMenu.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileViewModel {
  ProfileViewModel(this._auth, this._db);
  IDatabaseService _db;
  IFirebaseService _auth;

  String get getEmail => _auth.getEmailId!;

  setRestaurant(Restaurant restaurant) {
    List<RestaurantMenu> menu = restaurant.menu ?? [];
    List<Map<String, dynamic>> menuJson = menu.map((e) {
      return e.toJson();
    }).toList();
    restaurant = restaurant.copyWith(menu: null);
    Map<String, dynamic> json = (restaurant.toJson());
    json["menu"] = menuJson;
    _db.set(
        collection: "Restaurants",
        docId: _auth.getUserId!,
        data: json,
        merge: true);
  }
}
