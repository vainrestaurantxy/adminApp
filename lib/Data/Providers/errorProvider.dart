import 'dart:developer';

import 'package:flutter/material.dart';

class ErrorProvider extends ChangeNotifier {
  String? registerEmail;
  String? registerkey;
  String? registerReKey;
  String? restaurantName;
  String? restaurantCity;
  String? restaurantAddress;
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
    if (number.isEmpty) {
      price = "This Field can't be Empty";
    } else {
      this.price = validateNumberOnly(number);
    }
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

<<<<<<< Updated upstream
  validaterestaurantAddress(String restaurantState) {
    this.restaurantState = _validateisEmpty(restaurantState);
=======
  validaterestaurantAddress(String restaurantAddress) {
    this.restaurantAddress = _validateisEmpty(restaurantAddress);
>>>>>>> Stashed changes
    notifyListeners();
  }

  validatePhoneNo(String phone) {
<<<<<<< Updated upstream
    const pattern = r'^[0-9]{9}$';
    final regex = RegExp(pattern);
    if (phone.length != 9 || !regex.hasMatch(phone)) {
=======
    if (phone.length != 9) {
>>>>>>> Stashed changes
      phoneNo = "Invalid Phone Number";
    } else {
      phoneNo = null;
    }
    notifyListeners();
  }

  validateRegisterEmail(String email) {
    const pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
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
