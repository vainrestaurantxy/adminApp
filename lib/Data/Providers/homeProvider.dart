import 'package:flutter/material.dart';import 'package:admin_app/Model/Order/order.dart';

class HomeProvider extends ChangeNotifier{
  Map<String, List<Order>> orders ={};
  String state = "";
    update(){
    notifyListeners();
  }
  
}