import 'dart:math';

import 'package:admin_app/Data/Providers/cartProvider.dart';
import 'package:admin_app/Data/Providers/homeProvider.dart';
import 'package:admin_app/Data/Providers/restaurantProvider.dart';
import 'package:admin_app/View/Home/MenuPage/appBar.dart';
import 'package:admin_app/View/Home/MenuPage/sliverAppbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:provider/provider.dart' as prov;
import 'package:provider/provider.dart';
import '../../../Model/Restaurant/restaurant.dart';
import '../../../ViewModel/HomeViewModel/homeViewModel.dart';
import '../../../ViewModel/HomeViewModel/menuPageViewModel.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key, required this.id});
  final String id;
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<dynamic> keys = [];
  ScrollController controller = ScrollController();
  List<Widget> items = [];

  @override
  Widget build(BuildContext context) {
    // final repo = prov.Provider.of<MenuPageData>(context, listen: false);
    // repo.getRestaurant(widget.id, context);
    // Constants.id = widget.id;
    final viewModel = GetIt.instance<HomeViewModel>();
    final viewModelMenu = GetIt.instance<MenuPageViewModel>();
    viewModel.getRestaurant(context);
    return Consumer<HomeProvider>(
      builder: (_,  ref, __) {
        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Restaurants")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            Restaurant localRestaurant =
                Restaurant.fromJson(snapshot.data!.data()!);
            Provider.of<RestaurantData>(context).restaurant = localRestaurant;
            viewModelMenu.reArrangeCategory(context: context);
            viewModelMenu.createMenu(
                Provider.of<CartProvider>(context, listen: false)
                    .categoryDividedMenu);
            return Consumer<RestaurantData>(
              builder: (_, ref, __) {
                return Scaffold(
                  body: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      CustomScrollView(controller: controller, slivers: [
                        createCustomSliverAppBar(
                            restaurant: ref.restaurant!,
                            controller: controller),
                        SliverToBoxAdapter(
                            child: Column(
                          children: List.generate(viewModelMenu.items.length,
                              (index) => viewModelMenu.items[index]),
                        )),
                      ]),
                      SizedBox(
                          width: double.infinity,
                          height: 84,
                          child: createAppBar(context))
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
