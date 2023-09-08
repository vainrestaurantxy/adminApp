import 'dart:developer';

import 'package:flutter/material.dart';

class ErrorProvider extends ChangeNotifier {
  String? registerEmail;
  String? registerkey;
  String? registerReKey;
  String? restaurantName;
  String? restaurantCity;
  String? restaurantState;
  String? phoneNo;
  String? price;
  String? tax;
  String? discount;

  _validateisEmpty(String str) {
    if (str.isEmpty) {
      return "This Field can't be Empty";
    } else {
      return null;
    }
  }

  validateNumberOnly(String number) {
    String numericValue = '1234567890';
    for (var i in number.characters) {
      if (!numericValue.contains(i)) {
        return "Input Number Only";
      }
    }
    return null;
  }

  validateprice(String number) {
    this.price = validateNumberOnly(number);
    notifyListeners();
  }

  validatetax(String number) {
    this.tax = validateNumberOnly(number);
    notifyListeners();
  }

  validatediscount(String number) {
    this.discount = validateNumberOnly(number);
    notifyListeners();
  }

  validaterestaurantName(String restaurantName) {
    this.restaurantName = _validateisEmpty(restaurantName);
    notifyListeners();
  }

  validaterestaurantCity(String restaurantCity) {
    this.restaurantCity = _validateisEmpty(restaurantCity);
    notifyListeners();
  }

  validaterestaurantState(String restaurantState) {
    this.restaurantState = _validateisEmpty(restaurantState);
    notifyListeners();
  }

  validatePhoneNo(String phone) {
    if (phone.length != 10) {
      phoneNo = "Invalid Phone Number";
    } else {
      phoneNo = null;
    }
    notifyListeners();
  }

  validateRegisterEmail(String email) {
    final pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(email)) {
      registerEmail = "Invalid Email";
    } else {
      registerEmail = null;
    }
    notifyListeners();
  }

  validateRegisterpassword(String password) {
    if (password.length <= 4) {
      registerkey = "Too Short";
    } else if (password.length >= 50) {
      registerkey = "Too Long";
    } else {
      registerkey = null;
    }

    notifyListeners();
  }

  validateRegisterRepassword(
      {required String password, required String rePassword}) {
    if (password != rePassword) {
      registerReKey = "Passwords are not Matching";
    } else {
      registerReKey = null;
    }
    notifyListeners();
  }
}
