import 'dart:developer';

import 'package:admin_app/View/Home/MenuPage/menuPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_toast/web_toast.dart';

import '../../../Constants/Colors/colors.dart';
import '../../../Constants/Typography/typography.dart';
import '../../../Constants/Widgets/PrimaryButton.dart';
import '../../../Constants/Widgets/SecondaryButton.dart';
import '../../../Constants/Widgets/TextField.dart';
import '../../../Constants/Widgets/selectable.dart';
import '../../../Data/Providers/cartProvider.dart';
import '../../../Data/Providers/errorProvider.dart';
import '../../../Data/Providers/homeProvider.dart';
import '../../../Data/Providers/restaurantProvider.dart';
import '../../../Model/RestaurantMenu/restaurantMenu.dart';
import '../../../ViewModel/HomeViewModel/AddPageViewModel.dart';
import '../../../ViewModel/HomeViewModel/homeViewModel.dart';
import '../../../ViewModel/HomeViewModel/menuPageViewModel.dart';

class EditPage extends StatelessWidget {
  EditPage({super.key, required this.item});
  RestaurantMenu item;

  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController discount = TextEditingController();
  String genre = '';
  String orgName = "";
  String itemType = 'Dish';
  String radioValue = 'Exclusive';
  String category = "";
  final List<String> tags = [];
  int indexTags = -1;
  List<String> bestwith = [];

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<RestaurantData>(context, listen: false);
    print(item.toString());
    orgName = item.name ?? "";
    name.text = item.name ?? "";
    desc.text = item.description ?? "";
    price.text = item.price.toString();
    tax.text = item.tax.toString();
    discount.text = item.discount.toString();
    category = item.category ?? data.category[0] ?? "";
    itemType = item.itemType ?? "Dish";
    var bestwithunmodifiable = (item.recommendedWith as List<String>?) ?? [];
    List<String> bestwith = bestwithunmodifiable.map((e) => e).toList();
    // List<String>.
    genre = item.tags?[0] ?? "";
    String tag2 = item.tags?[1] ?? "";
    if (tag2 == "BestSeller") {
      indexTags = 0;
    } else if (tag2 == "New") {
      indexTags = 1;
    } else {
      indexTags = 2;
    }
    final viewModel = GetIt.instance<AddViewModel>();
    if (data.isClub) {
      itemType = "Drink";
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Consumer<HomeProvider>(
            builder: (_, ref, __) {
              return Consumer<ErrorProvider>(
                builder: (_, error, __) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 396.w,
                        height: 51.h,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Edit ${item.name}',
                              style: AppTypography.largeText.copyWith(
                                  color: AppColor.blackText,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 396.w,
                              child: Text(
                                'Add new items to your menu',
                                style: AppTypography.smallText
                                    .copyWith(color: AppColor.blackText),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Item Type",
                        style: AppTypography.smallText,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: RadioListTile.adaptive(
                                title: const Text("Dish"),
                                value: 'Dish',
                                groupValue: itemType,
                                activeColor: AppColor.purpleColor,
                                onChanged: (value) {
                                  itemType = value!;
                                  ref.update();
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile.adaptive(
                                title: const Text("Drink"),
                                value: 'Drink',
                                activeColor: AppColor.purpleColor,
                                groupValue: itemType,
                                onChanged: (value) {
                                  itemType = value!;
                                  ref.update();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                          onTap: () async {
                            await viewModel.getImagefromDevice();
                            viewModel.uploadImage(context);
                          },
                          child:
                              SecondaryButton(text: "Upload Item Thumbnail")),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: name,
                        errorText: error.restaurantCity,
                        hintText: "Enter Name",
                        label: const Text("Name"),
                        maxLength: 100,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: desc,
                        errorText: error.restaurantCity,
                        hintText: "Enter Description",
                        label: const Text("Description"),
                        maxLength: 400,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: price,
                        errorText: error.price,
                        onChanged: (value) {
                          ref.update();
                        },
                        hintText: "Enter Price",
                        label: const Text("Price(AED)"),
                        // maxLength: 1,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile.adaptive(
                                title: const Text("Inclusive of Taxes"),
                                value: 'Inclusive',
                                groupValue: radioValue,
                                activeColor: AppColor.purpleColor,
                                onChanged: (value) {
                                  radioValue = value!;
                                  tax.clear();
                                  ref.update();
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile.adaptive(
                                title: const Text("Exclusive of Taxes"),
                                value: 'Exclusive',
                                activeColor: AppColor.purpleColor,
                                groupValue: radioValue,
                                onChanged: (value) {
                                  radioValue = value!;
                                  ref.update();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: tax,
                        onChanged: (value) {
                          ref.update();
                        },
                        suffix: Text(
                            "Price With Tax: ${viewModel.calculateTax(tax.text, price.text)} AED"),
                        errorText: error.tax,
                        readOnly: radioValue == "Inclusive",
                        hintText: 'Enter Tax',
                        keyboardType: TextInputType.number,
                        label: const Text("Tax(%)"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        hintText: 'Enter Discount',
                        onChanged: (value) {
                          ref.update();
                        },
                        controller: discount,
                        suffix: Text(
                            "Price With Discount: ${viewModel.calculatediscount(tax.text, price.text, discount.text)} AED"),
                        keyboardType: TextInputType.number,
                        errorText: error.discount,
                        label: const Text("Discount(%)"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: data.category.isEmpty
                            ? const SizedBox()
                            : DropdownButton<String>(
                                alignment: Alignment.center,
                                hint: const Text("Category"),
                                onChanged: (value) {
                                  category = value ?? "";
                                  ref.update();
                                },
                                value: category,
                                icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded),
                                items: List.generate(
                                    data.category.length,
                                    (index) => DropdownMenuItem(
                                          child: Text(data.category[index]),
                                          value: data.category[index],
                                        )),
                              ),
                      ),
                      InkWell(
                        onTap: () {
                          context.go("/home/category");
                        },
                        child: SizedBox(
                          height: 20,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Add New Category",
                                style: AppTypography.smallText,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Genre",
                        style: AppTypography.largeText,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: RadioListTile.adaptive(
                                title: Text(
                                    (itemType == 'Dish') ? "Veg" : "Alcoholic"),
                                value:
                                    (itemType == 'Dish') ? "Veg" : "Alcoholic",
                                groupValue: genre,
                                activeColor: AppColor.purpleColor,
                                onChanged: (value) {
                                  genre = value!;
                                  ref.update();
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile.adaptive(
                                title: Text((itemType == 'Dish')
                                    ? "Non Veg"
                                    : "Non Alcoholic"),
                                value: (itemType == 'Dish')
                                    ? "Non Veg"
                                    : "Non Alcoholic",
                                activeColor: AppColor.purpleColor,
                                groupValue: genre,
                                onChanged: (value) {
                                  genre = value!;
                                  ref.update();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 396,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Tags\n',
                                style: AppTypography.smallText
                                    .copyWith(color: AppColor.purpleColor),
                              ),
                              TextSpan(
                                  text: 'Select any 1 tag',
                                  style: AppTypography.smallText
                                      .copyWith(color: AppColor.grey)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                if (indexTags == 0) {
                                  indexTags = -1;
                                } else
                                  indexTags = 0;
                                ref.update();
                              },
                              child: Selectable(
                                text: "BestSeller",
                                selected: indexTags == 0,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                              onTap: () {
                                if (indexTags == 1) {
                                  indexTags = -1;
                                } else
                                  indexTags = 1;
                                ref.update();
                              },
                              child: Selectable(
                                text: "New",
                                selected: indexTags == 1,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (indexTags == 2) {
                                indexTags = -1;
                              } else
                                indexTags = 2;
                              ref.update();
                            },
                            child: Selectable(
                              text: "Recommended",
                              selected: indexTags == 2,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: 396,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Recommend With?\n',
                                style: AppTypography.smallText
                                    .copyWith(color: AppColor.purpleColor),
                              ),
                              TextSpan(
                                text: 'Select 3 items (High Priority to Low)',
                                style: AppTypography.smallText
                                    .copyWith(color: AppColor.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Consumer<GetMenu>(
                        builder: (context, getMenu, child) {
                          getMenu.getMenu();
                          final listt = getMenu.dishesList;
                          //  bestwith;
                          log('dishes list ${listt.toString()}');
                          return Wrap(
                            children: List.generate(listt.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: GestureDetector(
                                    onTap: () {
                                      if (!bestwith.contains(listt[index])) {
                                        if (bestwith.length < 3) {
                                          bestwith.add("${listt[index]}");
                                          getMenu.notifyListeners();
                                          //  log('bestwith me ${bestwith.toString()}');
                                        }
                                      } else {
                                        bestwith.remove(listt[index]);
                                        getMenu.notifyListeners();
                                      }
                                      ref.update();
                                      log(bestwith
                                          .contains(listt[index])
                                          .toString());
                                    },
                                    child: Selectable(
                                      text: listt[index],
                                      selected: bestwith.contains(listt[index]),
                                      number:
                                          bestwith.indexOf(listt[index]) + 1,
                                    )),
                              );
                            }),
                          );
                        },
                      ),
                      Wrap(
                        children: List.generate(
                            tags.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: GestureDetector(
                                      onTap: () {
                                        if (!bestwith.contains(tags[index])) {
                                          if (bestwith.length < 3) {
                                            bestwith.add("${tags[index]}");
                                          }
                                        } else {
                                          bestwith.remove(tags[index]);
                                        }
                                        ref.update();
                                      },
                                      child: Selectable(
                                        text: tags[index],
                                        selected:
                                            bestwith.contains(tags[index]),
                                        number:
                                            bestwith.indexOf(tags[index]) + 1,
                                      )),
                                )),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (viewModel.validate(name.text, desc.text,
                              price.text, tax.text, discount.text, context)) {
                            String tag = "";
                            if (indexTags == 0) {
                              tag = "BestSeller";
                            } else if (indexTags == 1) {
                              tag = "New";
                            } else {
                              tag = "Recommended";
                            }
                            viewModel.updateDish(
                                orgName: orgName,
                                name: name.text,
                                image: item.image!,
                                category: category,
                                desc: desc.text,
                                discount: discount.text,
                                tax: tax.text,
                                itemType: itemType,
                                price: price.text,
                                genre: genre,
                                tag: tag,
                                recommendedWith: bestwith);
                            final viewModel2 = GetIt.instance<HomeViewModel>();
                            final viewModelmenu =
                                GetIt.instance<MenuPageViewModel>();
                            viewModel2.getRestaurant(context);
                            viewModelmenu.reArrangeCategory(context: context);
                            viewModelmenu.createMenu(Provider.of<CartProvider>(
                                    context,
                                    listen: false)
                                .categoryDividedMenu);
                            print(viewModelmenu.items);

                            Navigator.pop(context);

                            Toast.success(
                                title: 'Dish Updated',
                                text: 'Your dish has been updated',
                                duration: const Duration(seconds: 3));
                          }
                        },
                        child: PrimaryButton(
                          text: "Update Dish",
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
