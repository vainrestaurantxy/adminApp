import 'dart:developer';

import 'package:admin_app/Data/Providers/cartProvider.dart';
import 'package:admin_app/Data/Providers/homeProvider.dart';
import 'package:admin_app/Data/Repositories/DatabaseConnection.dart';
import 'package:admin_app/Model/Restaurant/restaurant.dart';
import 'package:admin_app/Model/RestaurantMenu/restaurantMenu.dart';
import 'package:flutter/material.dart';
import 'package:admin_app/Model/Order/order.dart' as model;
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@lazySingleton
class OrderViewModel {
  OrderViewModel(this._db);
  final IDatabaseService _db;
  saveOrder(model.Order order, context) async {
    Map<String, dynamic>? data = await _db.getSubcollection(
        "Restaurants",
        "Orders",
        '${DateTime.now().toUtc().day}|${DateTime.now().toUtc().month}|${DateTime.now().toUtc().year}');
    List<dynamic> list = data?["order"] ?? [];
    List<RestaurantMenu> items = order.items ?? [];
    List<dynamic> jsonItems = items.map((e) => e.toJson()).toList();

    order = order.copyWith(orderNo: list.length);
    Map<String, dynamic> jsonOrder = order.toJson();
    jsonOrder["items"] = jsonItems;
    list.add(jsonOrder);

    _db.setSubcollection(
        "Restaurants",
        "Orders",
        '${DateTime.now().toUtc().day}|${DateTime.now().toUtc().month}|${DateTime.now().toUtc().year}',
        {"order": list},
        true);
    Provider.of<CartProvider>(context).cart = {};

    Provider.of<CartProvider>(context).menuCart = [];
  }

  updateOrder(model.Order order, orderNo) async {
    var time =
        '${DateTime.now().toUtc().day}|${DateTime.now().toUtc().month}|${DateTime.now().toUtc().year}';
    Map<String, dynamic>? data =
        await _db.getSubcollection("Restaurants", "Orders", time);
    List<dynamic> list = data?["order"] ?? [];
    List<RestaurantMenu> items = order.items ?? [];
    List<dynamic> jsonItems = items.map((e) => e.toJson()).toList();

    order = order.copyWith(orderNo: orderNo);

    Map<String, dynamic> jsonOrder = order.toJson();
    //  print(jsonOrder);
    print(jsonOrder);
    jsonOrder["items"] = jsonItems;
    dynamic itemToBeRemoved =
        list.where((element) => element["orderNo"] == orderNo).first;
    log('itemsremoved $itemToBeRemoved');
    list.remove(itemToBeRemoved);

    log('removed elements list $list');
    list.add(jsonOrder);

    print('list $list');
    await _db.setSubcollection(
        "Restaurants", "Orders", time, {"order": list}, true);
  }

  getOrder(context) async {
    final ref = Provider.of<HomeProvider>(context, listen: false);
    DateTime dateTime = DateTime.now();
    for (int i = 0; i < 7; i++) {
      Map<String, dynamic>? data = await _db.getSubcollection(
        "Restaurants",
        "Orders",
        '${dateTime.toUtc().day}|${dateTime.toUtc().month}|${dateTime.toUtc().year}',
      );

      List<dynamic> list = data?["order"] ?? [];
      List<model.Order> order = list.map((e) {
        List<dynamic> itemJson = e["items"];
        List<RestaurantMenu> item =
            itemJson.map((t) => RestaurantMenu.fromJson(t)).toList();
        e["items"] = [];
        model.Order order = model.Order.fromJson(e);

        return order.copyWith(items: item);
      }).toList();
      ref.orders[
              '${dateTime.toUtc().day}/${dateTime.toUtc().month}/${dateTime.toUtc().year}'] =
          order;

      dateTime = dateTime.subtract(const Duration(days: 1));
    }

    ref.notifyListeners();
  }
}
