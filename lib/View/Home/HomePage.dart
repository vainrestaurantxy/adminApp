import 'dart:developer';

import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/SecondaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Constants/Widgets/selectable.dart';
import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Data/Providers/homeProvider.dart';
import 'package:admin_app/View/Home/AddPage/AddPage.dart';
import 'package:admin_app/View/Home/OrderPage/orderPage.dart';
import 'package:admin_app/View/Home/ProfilePage/profilePage.dart';
import 'package:admin_app/View/Home/QrPage/qrPage.dart';
import 'package:admin_app/ViewModel/HomeViewModel/homeViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../Data/Providers/restaurantProvider.dart';
import '../../ViewModel/HomeViewModel/AddPageViewModel.dart';
import 'MenuPage/menuPage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  int index = 0;
  List<Widget> screen = [
    const OrderPage(),
    QRPage(),
    AddPage(),
    MenuPage(id: FirebaseAuth.instance.currentUser!.uid),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<HomeViewModel>();
    viewModel.getRestaurant(context);

    viewModel.getCategory(context);
    return Consumer<HomeProvider>(builder: (_, ref, __) {
      return Scaffold(
          body: screen[index],
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: AppColor.purpleColor,
              currentIndex: index,
              onTap: (index) {
                this.index = index;
                ref.notifyListeners();
              },
              showUnselectedLabels: true,
              unselectedIconTheme: IconThemeData(
                size: 18,
                color: AppColor.blackText,
              ),
              selectedIconTheme: IconThemeData(
                size: 18,
                color: AppColor.purpleColor,
              ),
              unselectedItemColor: AppColor.blackText,
              selectedLabelStyle:
                  AppTypography.smallText.copyWith(color: AppColor.purpleColor),
              unselectedLabelStyle:
                  AppTypography.smallText.copyWith(color: AppColor.purpleColor),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.data_usage),
                    activeIcon: Icon(
                      Icons.data_usage,
                      color: AppColor.purpleColor,
                    ),
                    label: "Orders"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code),
                    activeIcon: Icon(
                      Icons.qr_code,
                      color: AppColor.purpleColor,
                    ),
                    // icon: SvgPicture.asset('assets/qr_code.svg'),
                    label: "QR Code"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    activeIcon: Icon(
                      Icons.add,
                      color: AppColor.purpleColor,
                    ),
                    label: "Add"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.fastfood),
                    activeIcon: Icon(
                      Icons.fastfood,
                      color: AppColor.purpleColor,
                    ),
                    // icon: SvgPicture.asset('assets/fastfood.svg'),
                    label: "Menu"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.restaurant),
                    activeIcon: Icon(
                      Icons.restaurant,
                      color: AppColor.purpleColor,
                    ),
                    // icon: SvgPicture.asset('assets/restaurant.svg'),
                    label: "Profile")
              ]));
    });
  }
}
