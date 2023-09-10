import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../Constants/Colors/colors.dart';
import '../../../Constants/Typography/typography.dart';
import '../../../Constants/Widgets/PrimaryButton.dart';
import '../../../Constants/Widgets/SecondaryButton.dart';
import '../../../Constants/Widgets/TextField.dart';
import '../../../Constants/Widgets/selectable.dart';
import '../../../Data/Providers/errorProvider.dart';
import '../../../Data/Providers/homeProvider.dart';
import '../../../Data/Providers/restaurantProvider.dart';
import '../../../ViewModel/HomeViewModel/AddPageViewModel.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController tax = TextEditingController();
  TextEditingController discount = TextEditingController();
  String genre = '';
  String itemType = 'Dish';
  String radioValue = 'Exclusive';
  String category = "";
  final List<String> tags = [
    "Egg",
    "Chicken",
    "Salad",
    "Raita",
    "Juice",
    "Paratha",
    "Pasta",
    "Coke",
    "Pizza",
    "Barfi"
  ];
  int indexTags = -1;
  List<String> bestwith = [];

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<AddViewModel>();
    final data = Provider.of<RestaurantData>(context);
    if (data.isClub) {
      itemType = "Drink";
    }
    if (data.category.isNotEmpty) {
      category = data.category[0];
    }
    return Scaffold(
      appBar: AppBar(),
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
                      Container(
                        width: 396.w,
                        height: 51.h,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add',
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
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: RadioListTile.adaptive(
                                title: Text("Dish"),
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
                                title: Text("Drink"),
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
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                          onTap: () async {
                            await viewModel.getImagefromDevice();
                            viewModel.uploadImage(context);
                          },
                          child:
                              SecondaryButton(text: "Upload Item Thumbnail")),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: name,
                        errorText: error.restaurantCity,
                        hintText: "Enter Name",
                        label: Text("Name"),
                        maxLength: 100,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: desc,
                        errorText: error.restaurantCity,
                        hintText: "Enter Description",
                        label: Text("Description"),
                        maxLength: 400,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: price,
                        errorText: error.price,
                        onChanged: (value) {
                          ref.update();
                        },
                        hintText: "Enter Price",
                        label: Text("Price(AED)"),
                        // maxLength: 1,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile.adaptive(
                                title: Text("Inclusive of VAT"),
                                value: 'Inclusive',
                                groupValue: radioValue,
                                activeColor: AppColor.purpleColor,
                                onChanged: (value) {
                                  tax.text = "0";
                                  radioValue = value!;

                                  ref.update();
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile.adaptive(
                                title: Text("Exclusive of VAT"),
                                value: 'Exclusive',
                                activeColor: AppColor.purpleColor,
                                groupValue: radioValue,
                                onChanged: (value) {
                                  tax.text = "5";
                                  radioValue = value!;
                                  ref.update();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: tax,
                        onChanged: (value) {
                          ref.update();
                        },
                        suffix: Text(
                            "Price With VAT: ${viewModel.calculateTax(tax.text, price.text)} AED"),
                        errorText: error.tax,
                        readOnly: true,
                        hintText: 'Enter VAT',
                        keyboardType: TextInputType.number,
                        label: Text("VAT(%)"),
                      ),
                      SizedBox(
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
                        label: Text("Discount(%)"),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: data.category.isEmpty
                            ? SizedBox()
                            : DropdownButton<String>(
                                alignment: Alignment.center,
                                hint: Text("Category"),
                                onChanged: (value) {
                                  category = value ?? "";
                                  ref.update();
                                },
                                value: category,
                                icon: Icon(Icons.keyboard_arrow_down_rounded),
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
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Genre",
                        style: AppTypography.largeText,
                      ),
                      Container(
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
                      SizedBox(
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
                          SizedBox(
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
                          SizedBox(
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
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                      SizedBox(
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
                      SizedBox(
                        height: 8,
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
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (viewModel.validate(name.text, desc.text,
                              price.text, tax.text, discount.text, context)) {
                            String tag = "";
                            if (indexTags == 0) {
                              tag = "Best Seller";
                            } else if (indexTags == 1) {
                              tag = "New";
                            } else {
                              tag = "Recommended";
                            }
                            viewModel.uploadDish(
                                name: name.text,
                                category: category,
                                desc: desc.text,
                                discount: discount.text,
                                tax: tax.text,
                                itemType: itemType,
                                price: price.text,
                                genre: genre,
                                tag: tag,
                                recommendedWith: bestwith);
                            name.clear();
                            desc.clear();
                            tax.clear();
                            discount.clear();
                            itemType = "Dish";
                            genre = "";
                            bestwith.clear();
                            tag = "";
                          }
                        },
                        child: PrimaryButton(
                          text: "Submit Dish",
                        ),
                      )
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
