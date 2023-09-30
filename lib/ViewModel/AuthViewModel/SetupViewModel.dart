import 'dart:developer';

import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Data/Providers/restaurantProvider.dart';
import 'package:admin_app/Data/Repositories/DatabaseConnection.dart';
import 'package:admin_app/Data/Repositories/FirebaseConnection.dart';
import 'package:admin_app/Model/Restaurant/restaurant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

@lazySingleton
class SetupViewModel {
  SetupViewModel(this._db, this._auth);
  IDatabaseService _db;
  IFirebaseService _auth;
  XFile? _logoImage;
  List<PaletteColor> colors = [];
  Restaurant? restaurant;

  setStaffKey(String staffKey) {
    _db.set(
        collection: "StaffLogin",
        docId: _auth.getEmailId!,
        data: {"staffkey": staffKey});
  }

  validate(
      {required String restaurantName,
      required String restaurantCity,
      String? restaurantAddress,
      required String phoneno,
      required BuildContext context}) {
    final validator = Provider.of<ErrorProvider>(context, listen: false);

    validator.validaterestaurantName(restaurantName);
    validator.validaterestaurantCity(restaurantCity);
    validator.validaterestaurantAddress(restaurantAddress!);
    validator.validatePhoneNo(phoneno);
    if (validator.phoneNo == null &&
        validator.restaurantName == null &&
        validator.restaurantState == null &&
        validator.restaurantCity == null) {
      return true;
    }
    return false;
  }

  addRestaurant(Restaurant restaurant, context) {
    Map<String, dynamic> json = (restaurant.toJson());
    Provider.of<RestaurantData>(context, listen: false).restaurant = restaurant;
    _db.set(
        collection: "Restaurants",
        docId: _auth.getUserId!,
        data: json,
        merge: false);
    _db.setStatus('restaurantAdded');
  }

  setColor(Color color) {
    _db.set(
        collection: "Restaurants",
        docId: _auth.getUserId!,
        data: {"color": color.value.toString()},
        merge: true);
    _db.setStatus("LoggedIn");
  }

  Future<XFile?> getImagefromDevice() async {
    XFile? imageFile = (await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery));
    _logoImage = imageFile;
    return _logoImage;
  }

  uploadImagetoStorage(context) async {
    return await _db.uploadImage(
        image: _logoImage!, id: _auth.getUserId!, context: context);
  }

  setlogo(String url) {
    log(url);
    _db.set(
        collection: "Restaurants",
        docId: _auth.getUserId!,
        data: {"logo": url, "color": "0xFFFFD79A"},
        merge: true);
  }

  upload(context) async {
    await uploadImagetoStorage(context);
  }

  getRestaurant(context) async {
    Map<String, dynamic>? json = await _db.get("Restaurants", _auth.getUserId!);
    restaurant = Restaurant.fromJson(json!);
    final data = Provider.of<RestaurantData>(context, listen: false);
    data.restaurant = restaurant;
    data.update();
  }

  palette(RestaurantData ref) async {
    Uint8List bytes = await _logoImage!.readAsBytes();
    // Response res = await http.get(Uri.parse(ref.restaurant!.logo!));
    // Uint8List bytes = res.bodyBytes;
    PaletteGenerator palette =
        await PaletteGenerator.fromImageProvider(MemoryImage(bytes));
    colors = palette.paletteColors;
    colors.insert(0, PaletteColor(Color(0xFFFFD79C), 0));
    ref.update();
  }
}
