import 'package:flutter/material.dart';

import '../../Model/Restaurant/restaurant.dart';

class RestaurantData extends ChangeNotifier {
  Restaurant? restaurant;
  bool isClub = false;
  List<dynamic> category = [];
  setCategories(List<dynamic> category) {
    this.category = category;
    notifyListeners();
  }
  
  update() {
    notifyListeners();
  }
}
