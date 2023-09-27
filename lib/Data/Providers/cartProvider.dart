import 'dart:developer';

import 'package:admin_app/Model/RestaurantMenu/restaurantMenu.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class CartProvider with ChangeNotifier {
  Map<String, int> cart = {};
  List<RestaurantMenu> menuCart = [];
  Map<String, List<RestaurantMenu>> categoryDividedMenu = {};

  addOnTap(String code, RestaurantMenu menu) {
    cart[code] = (cart[code] ?? 0) + 1;
    if (!menuCart.contains(menu)) {
      menuCart.add(menu);
    }
    notifyListeners();
  }

  getTotal() {
    double price = 0;
    for (var item in menuCart) {
      if (item.tax == 5) {
        price += ((item.price)! * (cart[item.name!] as double)) as double;
      } else if (item.tax == 0) {
        price += (item.price! * (cart[item.name!] as double) / 1.05);
      }
    }
    return price.toPrecision(2);
  }

  getDiscount() {
    double discount = 0;
    for (var item in menuCart) {
      if (item.tax == 5) {
        discount += ((item.price! * (cart[item.name!] as double) * 0.05)
                        .toPrecision(2) +
                    item.price! * (cart[item.name!] as double))
                .toPrecision(2) *
            item.discount! *
            0.01;
      } else if (item.tax == 0) {
        discount += item.price! *
            (cart[item.name!] as double).toPrecision(2) *
            item.discount! *
            0.01;
      }
    }
    return discount.toPrecision(2);
  }

  subOnTap(String code, RestaurantMenu menu) {
    if (cart[code] == 0) {
      return;
    }
    cart[code] = (cart[code] ?? 0) - 1;
    if (menuCart.contains(menu) && cart[code] == 0) {
      menuCart.remove(menu);
    }
    notifyListeners();
  }
}
