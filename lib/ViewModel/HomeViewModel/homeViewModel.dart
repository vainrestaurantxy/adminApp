import 'package:admin_app/Data/Providers/restaurantProvider.dart';
import 'package:admin_app/Data/Repositories/DatabaseConnection.dart';
import 'package:admin_app/Data/Repositories/FirebaseConnection.dart';
import 'package:admin_app/Model/Restaurant/restaurant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@lazySingleton
class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._db, this._auth);

  IDatabaseService _db;
  IFirebaseService _auth;
  getRestaurant(context) async {
    final ref = Provider.of<RestaurantData>(context, listen: false);
    Map<String, dynamic>? data = await _db.get("Restaurants", _auth.getUserId!);
    ref.restaurant = Restaurant.fromJson(data!);
    ref.notifyListeners();
  }

  getCategory(context) async {
    final ref = Provider.of<RestaurantData>(context, listen: false);
    Map<String, dynamic>? data = await _db.get("Category", _auth.getUserId!);
    ref.category = data?["categories"] ?? [];
    ref.notifyListeners();
  }

  Future<void> setTables(context, int tables) async {
    await _db.set(
        collection: "Restaurants",
        docId: _auth.getUserId!,
        data: {"noTable": tables},
        merge: true);
    await getRestaurant(context);
  }
}
