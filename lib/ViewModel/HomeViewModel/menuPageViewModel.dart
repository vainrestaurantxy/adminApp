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
  static String tag = '';
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
    List<String> category = [];

<<<<<<< Updated upstream
    if (tag == "") {
      for (var i in categoryDividedMenu.entries) {
        // keys.add(GlobalKey());
        GlobalKey key = GlobalKey();
        category.add(i.key);
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
=======
    for (var i in categoryDividedMenu.entries) {
      keys.add(GlobalKey());
      items.add(
        ExpansionTile(
          key: keys[keys.length - 1],
          title: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              i.key,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
        );
      }
    } else {
      for (var i in categoryDividedMenu.entries) {
        // keys.add(GlobalKey());
        //  print("filterd");
        GlobalKey key = GlobalKey();
        keys[i.key] = key;
        category.add(i.key);
        List<RestaurantMenu> filterdItems = i.value
            .where((element) => (element.tags?[0] ?? "") == tag)
            .toList();
        //  print(filterdItems);
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
=======
          childrenPadding: const EdgeInsets.all(8),
          initiallyExpanded: true,
          children: List.generate(
              i.value.length,
              (index) => Item(
                  item: i.value[index],
                  image: i.value[index].image!,
                  desc: i.value[index].description!,
                  price: i.value[index].price!,
                  name: i.value[index].name!,
                  code: i.value[index].code ?? "",
                  tags: i.value[index].tags!)),
        ),
      );
>>>>>>> Stashed changes
    }
    this.items = items;
    tags = category;
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
