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
    OrderPage(),
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
              fixedColor: AppColor.purpleColor,
              currentIndex: index,
              onTap: (index) {
                this.index = index;
                ref.notifyListeners();
              },
              showUnselectedLabels: true,
              selectedLabelStyle:
                  AppTypography.smallText.copyWith(color: AppColor.purpleColor),
              unselectedLabelStyle:
                  AppTypography.smallText.copyWith(color: AppColor.purpleColor),
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/data_usage.svg'),
                    label: "Orders"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/qr_code.svg'),
                    label: "QR Code"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/add.svg'), label: "Add"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/fastfood.svg'),
                    label: "Menu"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/restaurant.svg'),
                    label: "Profile")
              ]));
    });
  }
}
