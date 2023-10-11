import 'package:admin_app/Data/Providers/cartProvider.dart';
import 'package:admin_app/Data/Providers/restaurantProvider.dart';

import 'package:admin_app/Model/RestaurantMenu/restaurantMenu.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../../View/Home/MenuPage/widgets.dart';

@lazySingleton
class MenuPageViewModel extends ChangeNotifier {
  int selectedFilterIndex = -1;
  static List<String> tags = [];

  static String tag = "";
  static bool boolTag = false;
  List<Widget> items = [];
  static Map<String, GlobalKey> keys = {};
  reArrangeCategory({required BuildContext context}) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    final restaurant =
        Provider.of<RestaurantData>(context, listen: false).restaurant;
    Map<String, List<RestaurantMenu>> categoryDividedMenu = {};
    for (var item in restaurant?.menu ?? []) {
      if (categoryDividedMenu[item.category!] == null) {
        categoryDividedMenu[item.category!] = [];
      }
      categoryDividedMenu[item.category]!.add(item);
    }
    cart.categoryDividedMenu = categoryDividedMenu;
  }

  Map<String, RestaurantMenu> mapCodeToItem(List<RestaurantMenu> menu) {
    Map<String, RestaurantMenu> map = {};
    for (RestaurantMenu index in menu) {
      map[index.name!] = index;
    }
    return map;
  }

  createMenu(Map<String, List<RestaurantMenu>> categoryDividedMenu) {
    List<Widget> items = [];
    // print("object");
    print("from create menu $tag");
    print("from create menu $boolTag");

    if ((tag == "Veg" ||
            tag == "Non Veg" ||
            tag == "" ||
            tag == "Drinks" ||
            tag == "Recommended" ||
            tag == "Bestseller" ||
            tag == "New") &&
        boolTag != true) {
      for (var i in categoryDividedMenu.entries) {
        // keys.add(GlobalKey());
        GlobalKey key = GlobalKey();
        keys[i.key] = key;
        items.add(
          ExpansionTile(
            key: keys[i.key],
            title: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                i.key,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            childrenPadding: const EdgeInsets.all(8),
            initiallyExpanded: true,
            children: List.generate(
                i.value.length,
                (index) => Item(
                    item: i.value[index],
                    image: i.value[index].image ?? "",
                    desc: i.value[index].description ?? "",
                    price: i.value[index].price ?? 0,
                    name: i.value[index].name ?? "",
                    code: i.value[index].code ?? "",
                    tags: i.value[index].tags ?? [])),
          ),
        );
      }
    } else if (boolTag == true && tag == "Drinks") {
      for (var i in categoryDividedMenu.entries) {
        GlobalKey key = GlobalKey();
        keys[i.key] = key;
        List<RestaurantMenu> filterdItems = i.value
            .where((element) => (element.tags?[0] ?? "") == "Non Alcoholic")
            .toList();
        filterdItems = filterdItems +
            i.value
                .where((element) => (element.tags?[0] ?? "") == "Alcoholic")
                .toList();
        items.add(
          ExpansionTile(
            key: keys[i.key],
            title: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                i.key,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            childrenPadding: const EdgeInsets.all(8),
            initiallyExpanded: true,
            children: List.generate(
                filterdItems.length,
                (index) => Item(
                    item: filterdItems[index],
                    image: filterdItems[index].image ?? "",
                    desc: filterdItems[index].description ?? "",
                    price: filterdItems[index].price ?? 0,
                    name: filterdItems[index].name ?? "",
                    code: filterdItems[index].code ?? "",
                    tags: filterdItems[index].tags ?? [])),
          ),
        );
      }
    } else if (boolTag == true) {
      for (var i in categoryDividedMenu.entries) {
        GlobalKey key = GlobalKey();
        keys[i.key] = key;
        List<RestaurantMenu> filterdItems =
            i.value.where((element) => (element.tags!.contains(tag))).toList();
        items.add(
          ExpansionTile(
            key: keys[i.key],
            title: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                i.key,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            childrenPadding: const EdgeInsets.all(8),
            initiallyExpanded: true,
            children: List.generate(
                filterdItems.length,
                (index) => Item(
                    item: filterdItems[index],
                    image: filterdItems[index].image ?? "",
                    desc: filterdItems[index].description ?? "",
                    price: filterdItems[index].price ?? 0,
                    name: filterdItems[index].name ?? "",
                    code: filterdItems[index].code ?? "",
                    tags: filterdItems[index].tags ?? [])),
          ),
        );
      }
    }
    this.items = items;
    notifyListeners();

    // List<int> getItemsAndAmount(context){
    //   final prov = Provider.of<MenuPageData>(context,listen: false);
    //   int items=0;
    //   int amount=0;
    //   for( var i in prov.cart.entries){
    //     String code = i.key;
    //     int count = i.value;
    //     items+=count;
    //     amount+=count*prov.code_item[code]!.price;
    //   }
    //   return [items,amount];
    // }
  }
}
