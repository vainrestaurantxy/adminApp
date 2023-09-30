import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';

import 'package:admin_app/Data/Providers/homeProvider.dart';
import 'package:admin_app/View/Home/AddPage/AddPage.dart';
import 'package:admin_app/View/Home/OrderPage/orderPage.dart';
import 'package:admin_app/View/Home/ProfilePage/profilePage.dart';
import 'package:admin_app/View/Home/QrPage/qrPage.dart';
import 'package:admin_app/ViewModel/HomeViewModel/homeViewModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

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
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   automaticallyImplyLeading: false,
          //   title: Container(
          //     height: 100,
          //     width: 100,
          //     child: Image.asset(
          //       'assets/Small with Black BG.png',
          //       width: 200,
          //     ),
          //   ),
          // ),
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
              unselectedIconTheme: const IconThemeData(
                size: 18,
                color: AppColor.blackText,
              ),
              selectedIconTheme: const IconThemeData(
                size: 18,
                color: Color(0xff53389E),
              ),
              unselectedItemColor: AppColor.blackText,
              selectedLabelStyle: AppTypography.smallText.copyWith(
                color: Color(0xff53389E),
              ),
              unselectedLabelStyle:
                  AppTypography.smallText.copyWith(color: AppColor.purpleColor),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.data_usage),
                    activeIcon: Icon(
                      Icons.data_usage,
                      //  color: AppColor.purpleColor,
                    ),
                    label: "Orders"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code),
                    activeIcon: Icon(
                      Icons.qr_code,
                      //   color: AppColor.purpleColor,
                    ),
                    // icon: SvgPicture.asset('assets/qr_code.svg'),
                    label: "QR Code"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    activeIcon: Icon(
                      Icons.add,
                      //  color: AppColor.purpleColor,
                    ),
                    label: "Add"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.fastfood),
                    activeIcon: Icon(
                      Icons.fastfood,
                      //    color: AppColor.purpleColor,
                    ),
                    // icon: SvgPicture.asset('assets/fastfood.svg'),
                    label: "Menu"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.restaurant),
                    activeIcon: Icon(
                      Icons.restaurant,
                      //    color: AppColor.purpleColor,
                    ),
                    // icon: SvgPicture.asset('assets/restaurant.svg'),
                    label: "Profile")
              ]));
    });
  }
}

class StaffPage extends StatelessWidget {
  StaffPage({super.key});
  int index = 0;
  List<Widget> screen = [
    const OrderPage(),
    QRPage(),
    MenuPage(id: FirebaseAuth.instance.currentUser!.uid),
  ];
  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<HomeViewModel>();
    viewModel.getRestaurant(context);

    viewModel.getCategory(context);
    return Consumer<HomeProvider>(builder: (_, ref, __) {
      return Scaffold(
          appBar: AppBar(
            leading: Image.asset('assets/Small with Black BG.png'),
          ),
          body: screen[index],
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: Color(0xff53389E),
              currentIndex: index,
              onTap: (index) {
                this.index = index;
                ref.notifyListeners();
              },
              showUnselectedLabels: true,
              unselectedIconTheme: const IconThemeData(
                size: 18,
                color: AppColor.blackText,
              ),
              selectedIconTheme: const IconThemeData(
                size: 18,
                color: Color(0xff53389E),
              ),
              unselectedItemColor: AppColor.blackText,
              selectedLabelStyle:
                  AppTypography.smallText.copyWith(color: AppColor.purpleColor),
              unselectedLabelStyle:
                  AppTypography.smallText.copyWith(color: AppColor.purpleColor),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.data_usage),
                    activeIcon: Icon(
                      Icons.data_usage,
                      //  color: AppColor.purpleColor,
                    ),
                    label: "Orders"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.qr_code),
                    activeIcon: Icon(
                      Icons.qr_code,
                      //   color: AppColor.purpleColor,
                    ),
                    // icon: SvgPicture.asset('assets/qr_code.svg'),
                    label: "QR Code"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.fastfood),
                    activeIcon: Icon(
                      Icons.fastfood,
                      //    color: AppColor.purpleColor,
                    ),
                    // icon: SvgPicture.asset('assets/fastfood.svg'),
                    label: "Menu"),
              ]));
    });
  }
}
