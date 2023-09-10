import 'dart:developer';

import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Data/Providers/restaurantProvider.dart';
import 'package:admin_app/Model/Restaurant/restaurant.dart';
import 'package:admin_app/ViewModel/AuthViewModel/SetupViewModel.dart';
import 'package:admin_app/ViewModel/HomeViewModel/AddPageViewModel.dart';
import 'package:admin_app/ViewModel/HomeViewModel/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController staffKey = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<ProfileViewModel>();
    final addViewModel = GetIt.instance<SetupViewModel>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<ErrorProvider>(
        builder: (_, error, __) {
          return Consumer<RestaurantData>(
            builder: (_, ref, __) {
              log(ref.restaurant.toString());
              name.text = ref.restaurant?.name ?? "";
              city.text = ref.restaurant?.city ?? "";
              state.text = ref.restaurant?.state ?? "";
              staffKey.text = ref.restaurant?.staffKey ?? "";
              phone.text = ref.restaurant?.phone ?? "";
              return SingleChildScrollView(
                child: Column(
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
                            'Profile',
                            style: AppTypography.largeText.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColor.blackText),
                          ),
                          SizedBox(
                            width: 396.w,
                            child: Text(
                              'Edit your restaurant profile and account details',
                              style: AppTypography.smallText
                                  .copyWith(color: AppColor.blackText),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      hintText: "Email",
                      label: Text("Email Id"),
                      readOnly: true,
                      initialValue: viewModel.getEmail,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: 396.w,
                      child: Text(
                        'Your need to contact RestaurantXY help to edit email id.',
                        style: AppTypography.smallText
                            .copyWith(color: AppColor.disabledColor),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      readOnly: true,
                      controller: staffKey,
                      hintText: "Staff Key",
                      label: Text("Staff Account Key"),
                    ),
                    SizedBox(
                      width: 396.w,
                      child: Text(
                        'Your staff can use staff account key for login to take & manage orders. They will not have admin features - “profile” and “add”',
                        style: AppTypography.smallText
                            .copyWith(color: AppColor.disabledColor),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: 396.w,
                      child: Text(
                        'Logo',
                        style: AppTypography.smallText
                            .copyWith(color: AppColor.blackText),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await addViewModel.getImagefromDevice();
                        addViewModel.upload(context);
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 148.w,
                            height: 148.w,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: (ref.restaurant?.logo == null)
                                    ? NetworkImage(
                                        "https://via.placeholder.com/148x148")
                                    : NetworkImage(ref.restaurant!.logo!),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFF9997A1)),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            right: 16,
                            child: Container(
                              width: 36.w,
                              height: 36.h,
                              child: Icon(
                                Icons.edit,
                                color: AppColor.white,
                              ),
                              decoration: ShapeDecoration(
                                color: AppColor.purpleColor,
                                shape: OvalBorder(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      hintText: "Enter Name",
                      errorText: error.registerEmail,
                      label: Text("Restaurant Name"),
                      controller: name,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      hintText: "Enter City",
                      errorText: error.restaurantCity,
                      label: Text("Restaurant City"),
                      controller: city,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      hintText: "Enter State",
                      errorText: error.restaurantState,
                      label: Text("Restaurant State"),
                      controller: state,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      hintText: "Enter Phone No.",
                      prefix: Text(
                        "+971 ",
                        style: AppTypography.mediumText,
                      ),
                      errorText: error.phoneNo,
                      label: Text("Restaurant Phone no."),
                      controller: phone,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (addViewModel.validate(
                            restaurantName: name.text,
                            restaurantCity: city.text,
                            restaurantState: state.text,
                            phoneno: phone.text,
                            context: context)) {
                          log("here");
                          if (ref.restaurant == null) {
                            ref.restaurant = Restaurant(
                                name: name.text,
                                staffKey: staffKey.text,
                                city: city.text,
                                state: state.text,
                                phone: phone.text);
                          } else {
                            ref.restaurant = ref.restaurant!.copyWith(
                                name: name.text,
                                city: city.text,
                                staffKey: staffKey.text,
                                state: state.text,
                                phone: phone.text);
                          }
                          viewModel.setRestaurant(ref.restaurant!);
                        }
                      },
                      child: PrimaryButton(
                        text: "Update Account",
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
