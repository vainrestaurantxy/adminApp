import 'dart:convert';
import 'dart:developer';

import 'package:admin_app/Data/Providers/cartProvider.dart';
import 'package:admin_app/Data/Providers/restaurantProvider.dart';
import 'package:admin_app/View/Home/MenuPage/appBar.dart';
import 'package:admin_app/View/Home/MenuPage/sliverAppbar.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart' as prov;
import 'package:provider/provider.dart';
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
    viewModel.getRestaurant(context);
    return prov.Consumer<RestaurantData>(
      builder: (context, ref, __) {
        if (ref.restaurant == null) {
          return const Scaffold(
              backgroundColor: (Colors.black),
              body: Center(
                child: CircularProgressIndicator(),
              ));
        }
        MenuPageViewModel().reArrangeCategory(context: context);
        items = MenuPageViewModel().createMenu(
            Provider.of<CartProvider>(context, listen: false)
                .categoryDividedMenu);
        return Scaffold(
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomScrollView(controller: controller, slivers: [
                createCustomSliverAppBar(
                    restaurant: ref.restaurant!, controller: controller),
                SliverToBoxAdapter(
                    child: Column(
                  children:
                      List.generate(items.length, (index) => items[index]),
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
  }
}
