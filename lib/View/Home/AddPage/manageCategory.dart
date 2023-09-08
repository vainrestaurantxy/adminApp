import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/SecondaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Data/Providers/restaurantProvider.dart';
import 'package:admin_app/View/Home/AddPage/widget.dart';
import 'package:admin_app/ViewModel/HomeViewModel/AddPageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ManageCategory extends StatelessWidget {
  ManageCategory({super.key});
  TextEditingController name = TextEditingController();
  int selectedindex = -1;

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<AddViewModel>();
    viewModel.getCategory(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Manage Categories',
                      style: AppTypography.smallText.copyWith(
                          color: AppColor.blackText,
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                  SizedBox(
                    width: 396.w,
                    child: Text(
                        'Create a new category of dishes here or delete the existing ones. It will be visible in the menu.',
                        style: AppTypography.smallText.copyWith(
                            color: AppColor.blackText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 28,
            ),
            Consumer<RestaurantData>(
              builder: (_, ref, __) {
                return CustomTextField(
                  controller: name,
                  onChanged: (p0) {
                    ref.notifyListeners();
                  },
                  hintText: "Enter Category",
                  label: Text("Name"),
                  maxLength: 100,
                );
              },
            ),
            SizedBox(
              height: 16,
            ),
            Consumer<RestaurantData>(
              builder: (_, ref, __) {
                return Container(
                  child: (selectedindex == -1)
                      ? GestureDetector(
                          onTap: () {
                            if (name.text.isNotEmpty) {
                              viewModel.setCategory(name.text, context);
                              name.clear();
                            }
                          },
                          child: PrimaryButton(text: "Add New Category"))
                      : Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  if (name.text.isNotEmpty) {
                                    viewModel.updateCategory(
                                        selectedindex, name.text, context);
                                    name.clear();
                                    selectedindex = -1;
                                    ref.notifyListeners();
                                  }
                                },
                                child: PrimaryButton(
                                  text: "Update",
                                  disabled:
                                      ref.category[selectedindex] == name.text,
                                  width: (396 / 2) - 16 as int,
                                )),
                            SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                                onTap: () {
                                  if (name.text.isNotEmpty) {
                                    viewModel.deleteCategory(
                                        selectedindex, context);
                                    name.clear();
                                    selectedindex = -1;
                                    ref.notifyListeners();
                                  }
                                },
                                child: SecondaryButton(
                                  text: "Delete",
                                  borderColor: AppColor.errorColor,
                                  width: (396 / 2) - 16 as int,
                                ))
                          ],
                        ),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'All Categories - Select to edit or delete',
              style:
                  AppTypography.smallText.copyWith(color: AppColor.blackText),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Consumer<RestaurantData>(
                builder: (_, ref, __) {
                  return ListView.builder(
                    itemCount: ref.category.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                          onTap: () {
                            if (selectedindex == index) {
                              selectedindex = -1;
                              name.clear();
                            } else {
                              selectedindex = index;
                              name.text = ref.category[selectedindex];
                            }

                            ref.notifyListeners();
                          },
                          child: CategoryWidget(
                            name: ref.category[index],
                            selected: selectedindex == index,
                          )),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
