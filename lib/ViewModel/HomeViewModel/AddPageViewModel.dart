import 'dart:developer';

import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Data/Repositories/DatabaseConnection.dart';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../../Data/Providers/restaurantProvider.dart';
import '../../Data/Repositories/FirebaseConnection.dart';
import '../../Model/RestaurantMenu/restaurantMenu.dart';

@lazySingleton
class AddViewModel {
  AddViewModel(this._db, this._auth);
  final IDatabaseService _db;
  final IFirebaseService _auth;
  XFile? dishImage;
  RestaurantMenu? dish;

  Future<XFile?> getImagefromDevice() async {
    // ignore: invalid_use_of_visible_for_testing_member
    XFile? imageFile = (await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery));

    dishImage = imageFile;

    return dishImage;
  }

  uploadDish(
      {required String name,
      required String category,
      required String desc,
      required String discount,
      required String tax,
      required String itemType,
      required String price,
      List<String>? recommendedWith,
      required String genre,
      String? tag}) async {
    List<String> tags = tag == null ? [genre] : [genre, tag];

    dish = dish!.copyWith(
      name: name,
      category: category,
      description: desc,
      discount: int.parse(discount),
      itemType: itemType,
      price: int.parse(price),
      recommendedWith: recommendedWith ?? [],
      tags: tags,
      tax: int.parse(tax),
    );
    log(dish.toString());
    Map<String, dynamic>? json = await _db.get("Restaurants", _auth.getUserId!);
    List<dynamic> data = json?["menu"] ?? [];
    data.add(dish!.toJson());
    _db.set(
        collection: "Restaurants",
        docId: _auth.getUserId!,
        data: {"menu": data},
        merge: true);
  }

  updateDish(
      {required String name,
      required String category,
      required String desc,
      required String image,
      required String discount,
      required String tax,
      required String itemType,
      required String orgName,
      required String price,
      List<String>? recommendedWith,
      required String genre,
      String? tag}) async {
    List<String> tags = tag == null ? [genre] : [genre, tag];
    if (dish == null) {
      dish = RestaurantMenu(
        image: image,
        name: name,
        category: category,
        description: desc,
        discount: int.parse(discount),
        itemType: itemType,
        price: int.parse(price),
        recommendedWith: recommendedWith ?? [],
        tags: tags,
        tax: int.parse(tax),
      );
    } else {
      dish = dish!.copyWith(
        name: name,
        category: category,
        description: desc,
        discount: int.parse(discount),
        itemType: itemType,
        price: int.parse(price),
        recommendedWith: recommendedWith ?? [],
        tags: tags,
        tax: int.parse(tax),
      );
    }
    log(dish.toString());
    Map<String, dynamic>? json = await _db.get("Restaurants", _auth.getUserId!);
    List<dynamic> data = json?["menu"] ?? [];
    dynamic dataToBeDeleted =
        data.where((element) => element["name"] == orgName).first;
    data.remove(dataToBeDeleted);
    data.add(dish!.toJson());
    _db.set(
        collection: "Restaurants",
        docId: _auth.getUserId!,
        data: {"menu": data},
        merge: true);
  }

  uploadImage(context) async {
    await _db.uploadImage(
        image: dishImage!,
        id: "dishes/${_auth.getUserId}/${dishImage!.name}",
        context: context,
        where: "dish");
  }

  setImage(String image) {
    dish = RestaurantMenu(image: image);
    log(dish?.image ?? "Null");
  }

  validate(String name, String desc, String price, String tax, String discount,
      context) {
    final ref = Provider.of<ErrorProvider>(context, listen: false);
    ref.validaterestaurantName(name);
    ref.validaterestaurantCity(desc);
    ref.validateprice(price);
    ref.validatetax(tax);
    ref.validatediscount(discount);
    if (ref.restaurantName == null &&
        ref.restaurantCity == null &&
        ref.price == null &&
        ref.tax == null &&
        ref.discount == null) {
      return true;
    }
    return false;
  }

  calculateTax(String tax, String price) {
    int taxI, priceI;
    try {
      taxI = int.parse(tax);
      priceI = int.parse(price);
    } catch (e) {
      return 0;
    }
    return priceI + priceI * taxI * 0.01;
  }

  calculatediscount(String tax, String price, String discount) {
    int taxI, priceI, discountI;
    try {
      try {
        taxI = int.parse(tax);
      } catch (e) {
        taxI = 0;
      } finally {
        priceI = int.parse(price);
        discountI = int.parse(discount);
      }
    } catch (e) {
      return 0;
    }
    double taxAmmount = priceI + priceI * taxI * 0.01;
    return taxAmmount - taxAmmount * discountI * 0.01;
  }

  getCategory(context) async {
    Map<String, dynamic>? array = await _db.get("Category", _auth.getUserId!);
    List<dynamic> data = array?["categories"] ?? [];
    final ref =
        Provider.of<RestaurantData>(context, listen: false).setCategories(data);
  }

  setCategory(String name, context) async {
    Map<String, dynamic>? array = await _db.get("Category", _auth.getUserId!);
    List<dynamic> data = array?["categories"] ?? [];
    data.add(name);
    await _db.set(
        collection: "Category",
        docId: _auth.getUserId!,
        data: {"categories": data});
    getCategory(context);
  }

  String get getuserID => _auth.getUserId!;

  updateCategory(int index, String newName, context) async {
    final ref = Provider.of<RestaurantData>(context, listen: false);
    ref.category[index] = newName;
    await _db.set(
        collection: "Category",
        docId: _auth.getUserId!,
        data: {"categories": ref.category});
    getCategory(context);
  }

  deleteCategory(int index, context) async {
    final ref = Provider.of<RestaurantData>(context, listen: false);
    ref.category.removeAt(index);
    await _db.set(
        collection: "Category",
        docId: _auth.getUserId!,
        data: {"categories": ref.category});
    getCategory(context);
  }
}
