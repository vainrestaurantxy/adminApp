import 'dart:math';

import 'package:admin_app/Data/Providers/cartProvider.dart';
import 'package:admin_app/Data/Providers/homeProvider.dart';
import 'package:admin_app/Data/Providers/restaurantProvider.dart';
import 'package:admin_app/View/Home/MenuPage/appBar.dart';
import 'package:admin_app/View/Home/MenuPage/sliverAppbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  Widget build(BuildContext context) {
    // final repo = prov.Provider.of<MenuPageData>(context, listen: false);
    // repo.getRestaurant(widget.id, context);
    // Constants.id = widget.id;
    List<String> genre = [
      'Veg',
      'Non Veg',
      'Drinks',
      'Recommended',
      "Bestseller",
      "New"
    ];
    Map<String, String> icons = {
      "Veg": "assets/veg.svg",
      "Non Veg": "assets/non-veg.svg",
      "Drinks": "assets/drinks.svg",
      "Recommended": "assets/recommend.svg",
      "Bestseller": "assets/bestseller.svg",
      "New": "assets/new.svg",
    };
    final viewModel = GetIt.instance<HomeViewModel>();
    final cart = Provider.of<CartProvider>(context, listen: false);
    final viewModelMenu = GetIt.instance<MenuPageViewModel>();
    final prov = Provider.of<RestaurantData>(context);
    viewModel.getRestaurant(context);
    return Consumer<RestaurantData>(
      builder: (_, ref, __) {
        viewModelMenu.reArrangeCategory(context: context);
        viewModelMenu.createMenu(cart.categoryDividedMenu);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 212,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            Color(int.parse(
                                prov.restaurant?.color ?? "0xFFFFFF")),
                            Colors.white
                          ])),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: Image.network(prov.restaurant?.logo ?? ""),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(prov.restaurant?.name ?? "",
                              style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              )),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                              "${prov.restaurant?.city}, ${prov.restaurant?.state}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: 130,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Filters',
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 32,
                          width: double.infinity,
                          child: Center(
                            child: ListView.builder(
                              controller: controller,
                              itemCount: genre.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                // log('Sliverbar page tags ${restaurant?.tags.toString()}');
                                return Consumer<MenuPageViewModel>(
                                  builder: (context, ref, child) {
                                    // if (index < genre.length) {
                                    return GestureDetector(
                                      onTap: () {
                                        switch (index) {
                                          case 0:
                                            {
                                              if (MenuPageViewModel.boolTag ==
                                                  false) {
                                                MenuPageViewModel.boolTag =
                                                    true;
                                                MenuPageViewModel.tag = "Veg";
                                                ref.selectedFilterIndex = index;
                                              } else {
                                                MenuPageViewModel.boolTag =
                                                    false;
                                                MenuPageViewModel.tag = "";
                                                ref.selectedFilterIndex = -1;
                                              }
                                            }
                                            break;
                                          case 1:
                                            {
                                              if (MenuPageViewModel.boolTag ==
                                                  false) {
                                                MenuPageViewModel.boolTag =
                                                    true;
                                                MenuPageViewModel.tag =
                                                    "Non Veg";
                                                ref.selectedFilterIndex = index;
                                              } else {
                                                MenuPageViewModel.boolTag =
                                                    false;
                                                MenuPageViewModel.tag = "";
                                                ref.selectedFilterIndex = -1;
                                              }
                                            }
                                            break;
                                          case 2:
                                            {
                                              if (MenuPageViewModel.boolTag ==
                                                  false) {
                                                MenuPageViewModel.boolTag =
                                                    true;
                                                MenuPageViewModel.tag =
                                                    "Drinks";
                                                ref.selectedFilterIndex = index;
                                              } else {
                                                MenuPageViewModel.boolTag =
                                                    false;
                                                MenuPageViewModel.tag = "";
                                                ref.selectedFilterIndex = -1;
                                              }
                                            }
                                            break;
                                          case 3:
                                            {
                                              if (MenuPageViewModel.boolTag ==
                                                  false) {
                                                MenuPageViewModel.boolTag =
                                                    true;
                                                MenuPageViewModel.tag =
                                                    "Recommended";
                                                ref.selectedFilterIndex = index;
                                              } else {
                                                MenuPageViewModel.boolTag =
                                                    false;
                                                MenuPageViewModel.tag = "";
                                                ref.selectedFilterIndex = -1;
                                              }
                                            }
                                            break;

                                          case 4:
                                            {
                                              if (MenuPageViewModel.boolTag ==
                                                  false) {
                                                MenuPageViewModel.boolTag =
                                                    true;
                                                MenuPageViewModel.tag =
                                                    "Bestseller";
                                                ref.selectedFilterIndex = index;
                                              } else {
                                                MenuPageViewModel.boolTag =
                                                    false;
                                                MenuPageViewModel.tag = "";
                                                ref.selectedFilterIndex = -1;
                                              }
                                            }
                                            break;

                                          case 5:
                                            {
                                              if (MenuPageViewModel.boolTag ==
                                                  false) {
                                                MenuPageViewModel.boolTag =
                                                    true;
                                                MenuPageViewModel.tag = "New";
                                                ref.selectedFilterIndex = index;
                                              } else {
                                                MenuPageViewModel.boolTag =
                                                    false;
                                                MenuPageViewModel.tag = "";
                                                ref.selectedFilterIndex = -1;
                                              }
                                            }
                                            break;
                                          default:
                                            {
                                              if (MenuPageViewModel.boolTag ==
                                                  false) {
                                                MenuPageViewModel.boolTag =
                                                    true;
                                                MenuPageViewModel.tag = "";
                                                ref.selectedFilterIndex = index;
                                              } else {
                                                MenuPageViewModel.boolTag =
                                                    false;
                                                MenuPageViewModel.tag = "";
                                                ref.selectedFilterIndex = -1;
                                              }
                                            }
                                            break;
                                        }
                                        // if (index == 0) {
                                        //     if(  MenuPageViewModel.boolTag==false){
                                        //       MenuPageViewModel.boolTag=true;
                                        //       MenuPageViewModel.tag = "Veg";
                                        //       ref.selectedFilterIndex=index;
                                        //     } else{
                                        //       MenuPageViewModel.boolTag=false;
                                        //       MenuPageViewModel.tag = "Veg";
                                        //       ref.selectedFilterIndex=-1;
                                        //     }
                                        // }
                                        // else if (index == 1) {
                                        //   //
                                        //   if(  MenuPageViewModel.boolTag==false){
                                        //     MenuPageViewModel.boolTag=true;
                                        //     MenuPageViewModel.tag = "Non Veg";
                                        //     ref.selectedFilterIndex=index;
                                        //   }else {
                                        //     MenuPageViewModel.boolTag = false;
                                        //     MenuPageViewModel.tag = "Non Veg";
                                        //     ref.selectedFilterIndex=-1;
                                        //   }
                                        // }

                                        // else if (index == 2) {
                                        //   ref.selectedFilterIndex = 2;
                                        //   MenuPageViewModel.tag =
                                        //       "Recommended";
                                        // }
                                        final provider =
                                            Provider.of<RestaurantData>(context,
                                                listen: false);
                                        provider.notifyListeners();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 4),
                                          decoration: BoxDecoration(
                                              color: ref.selectedFilterIndex ==
                                                          index &&
                                                      MenuPageViewModel
                                                              .boolTag ==
                                                          true
                                                  ? Color(0xff88001f)
                                                  : Colors.transparent,
                                              border: Border.all(
                                                  color:
                                                      const Color(0xFFF4F4FF)),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                  icons[genre[index]]!,
                                                  width: 20,
                                                  height: 20,
                                                  color:
                                                      ref.selectedFilterIndex ==
                                                                  index &&
                                                              MenuPageViewModel
                                                                  .boolTag
                                                          ? Colors.white
                                                          : null),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(genre[index],
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color:
                                                        ref.selectedFilterIndex !=
                                                                index
                                                            ? Colors.black
                                                            : Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                    // else {
                                    //   final resIndex = index - genre.length;
                                    //   return GestureDetector(
                                    //     onTap: () {
                                    //       // print(MenuPageViewModel.keys);
                                    //       ref.selectedFilterIndex = -1;
                                    //       ref.notifyListeners();
                                    //     },
                                    //     child: Padding(
                                    //       padding: const EdgeInsets.symmetric(
                                    //           horizontal: 4.0),
                                    //       child: Container(
                                    //         padding: const EdgeInsets.symmetric(
                                    //             horizontal: 8.0, vertical: 4),
                                    //         decoration: BoxDecoration(
                                    //             border: Border.all(
                                    //                 color: const Color(
                                    //                     0xFFF4F4FF)),
                                    //             borderRadius:
                                    //                 BorderRadius.circular(4)),
                                    //         child: Row(
                                    //           children: [
                                    //             SvgPicture.asset(
                                    //               "assets/fastfood.svg",
                                    //               width: 20,
                                    //               height: 20,
                                    //             ),
                                    //             const SizedBox(
                                    //               width: 10,
                                    //             ),
                                    //             Text(
                                    //                 restaurant!.tags![resIndex],
                                    //                 style: const TextStyle(
                                    //                   fontSize: 12,
                                    //                   color: Colors.black,
                                    //                   fontWeight:
                                    //                       FontWeight.w500,
                                    //                 ))
                                    //           ],
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   );
                                    // }
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Column(
                  children: List.generate(viewModelMenu.items.length,
                      (index) => viewModelMenu.items[index]),
                ),
                //   CustomScrollView(controller: controller, slivers: [
                //     SliverAppBar(
                //     automaticallyImplyLeading: false,
                //     floating: false,
                //     expandedHeight: 355,
                //     elevation: 0,
                //     pinned: true,
                //     collapsedHeight: 130,
                //     flexibleSpace: FlexibleSpaceBar(
                //       expandedTitleScale: 1,
                //       titlePadding: const EdgeInsets.all(0),
                //       title: Container(
                //         color: Colors.white,
                //         width: double.infinity,
                //         height: 130,
                //         child: Padding(
                //           padding:
                //           const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                //           child: Column(
                //             children: [
                //
                //               const SizedBox(
                //                 height: 50,
                //               ),
                //
                //               Align(
                //                 alignment: Alignment.bottomLeft,
                //                 child: Text(
                //                   'Categories & Filters',
                //                   style: GoogleFonts.poppins(
                //                       fontSize: 16,
                //                       fontWeight: FontWeight.w500,
                //                       color: Colors.black),
                //                 ),
                //               ),
                //               const SizedBox(
                //                 height: 8,
                //               ),
                //
                //               SizedBox(
                //                 height: 32,
                //                 width: double.infinity,
                //                 child: Center(
                //                   child: ListView.builder(
                //                     controller: controller,
                //                     itemCount: (restaurant?.tags?.length ?? 0) + genre.length,
                //                     scrollDirection: Axis.horizontal,
                //                     itemBuilder: (context, index) {
                //                        // log('Sliverbar page tags ${restaurant?.tags.toString()}');
                //                       return prov.Consumer<MenuPageViewModel>(
                //                         builder: (context, ref, child) {
                //                           if (index < genre.length) {
                //                             return GestureDetector(
                //                               onTap: () {
                //                                 // print("filter");
                //                                 if (index == 0) {
                //                                   if (ref.selectedFilterIndex != 0) {
                //                                     ref.selectedFilterIndex = 0;
                //                                     MenuPageViewModel.tag = "";
                //                                   } else {
                //                                     ref.selectedFilterIndex = -1;
                //                                     MenuPageViewModel.tag = "Veg";
                //                                   }
                //                                 } else if (index == 1) {
                //                                   if (ref.selectedFilterIndex != 1) {
                //                                     ref.selectedFilterIndex = 1;
                //                                     MenuPageViewModel.tag = "";
                //                                   } else {
                //                                     ref.selectedFilterIndex = -1;
                //                                     MenuPageViewModel.tag = "Non Veg";
                //                                   }
                //                                 } else if (index == 2) {
                //                                   ref.selectedFilterIndex = 2;
                //                                   MenuPageViewModel.tag = "Recommended";
                //                                 }
                //                                 final provider =
                //                                 prov.Provider.of<RestaurantBuilder>(
                //                                     context,
                //                                     listen: false);
                //                                 provider.notifyListeners();
                //
                //                               },
                //                               child: Padding(
                //                                 padding: const EdgeInsets.symmetric(
                //                                     horizontal: 4.0),
                //                                 child: Container(
                //                                   padding: const EdgeInsets.symmetric(
                //                                       horizontal: 8.0, vertical: 4),
                //                                   decoration: BoxDecoration(
                //                                       color:
                //                                       ref.selectedFilterIndex == index
                //                                           ? Color(0xff323232)
                //                                           : Colors.transparent,
                //                                       border: Border.all(
                //                                           color: const Color(0xFFF4F4FF)),
                //                                       borderRadius:
                //                                       BorderRadius.circular(4)),
                //                                   child: Row(
                //                                     children: [
                //                                       ref.selectedFilterIndex != index
                //                                           ? SvgPicture.asset(
                //                                         "assets/fastfood.svg",
                //                                         width: 20,
                //                                         height: 20,
                //                                       )
                //                                           : Image.asset(
                //                                         'assets/fastfoodwhite.png',
                //                                         height: 20,
                //                                         width: 20,
                //                                       ),
                //                                       const SizedBox(
                //                                         width: 10,
                //                                       ),
                //                                       Text(genre[index],
                //                                           style: TextStyle(
                //                                             fontSize: 12,
                //                                             color:
                //                                             ref.selectedFilterIndex !=
                //                                                 index
                //                                                 ? Colors.black
                //                                                 : Colors.white,
                //                                             fontWeight: FontWeight.w500,
                //                                           ))
                //                                     ],
                //                                   ),
                //                                 ),
                //                               ),
                //                             );
                //                           } else {
                //                             final resIndex = index - genre.length;
                //                             return GestureDetector(
                //                               onTap: () {
                //                                 // print(MenuPageViewModel.keys);
                //                                 ref.selectedFilterIndex = -1;
                //                                 ref.notifyListeners();
                //                               },
                //                               child: Padding(
                //                                 padding: const EdgeInsets.symmetric(
                //                                     horizontal: 4.0),
                //                                 child: Container(
                //                                   padding: const EdgeInsets.symmetric(
                //                                       horizontal: 8.0, vertical: 4),
                //                                   decoration: BoxDecoration(
                //                                       border: Border.all(
                //                                           color: const Color(0xFFF4F4FF)),
                //                                       borderRadius:
                //                                       BorderRadius.circular(4)),
                //                                   child: Row(
                //                                     children: [
                //                                       SvgPicture.asset(
                //                                         "assets/fastfood.svg",
                //                                         width: 20,
                //                                         height: 20,
                //                                       ),
                //                                       const SizedBox(
                //                                         width: 10,
                //                                       ),
                //                                       Text(restaurant!.tags![resIndex],
                //                                           style: const TextStyle(
                //                                             fontSize: 12,
                //                                             color: Colors.black,
                //                                             fontWeight: FontWeight.w500,
                //                                           ))
                //                                     ],
                //                                   ),
                //                                 ),
                //                               ),
                //                             );
                //                           }
                //                         },
                //                       );
                //                     },
                //                   ),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //       collapseMode: CollapseMode.parallax,
                //       background: Stack(
                //         children: [
                //           Container(
                //             decoration: BoxDecoration(
                //                 gradient: LinearGradient(
                //                     begin: Alignment.topCenter,
                //                     end: Alignment.center,
                //                     colors: [
                //                       Color(int.parse(restaurant?.color ?? "0xFFFFFF")),
                //                       Colors.white
                //                     ])),
                //           ),
                //           SizedBox(
                //             width: double.infinity,
                //             child: Column(
                //               children: [
                //                 const SizedBox(
                //                   height: 100,
                //                 ),
                //                 SizedBox(
                //                   width: 100,
                //                   height: 50,
                //                   child: Image.network(restaurant?.logo ?? ""),
                //                 ),
                //                 const SizedBox(
                //                   height: 8,
                //                 ),
                //                 Text(restaurant?.name ?? "",
                //                     style: const TextStyle(
                //                       fontSize: 24,
                //                       color: Colors.black,
                //                       fontWeight: FontWeight.w600,
                //                     )),
                //                 const SizedBox(
                //                   height: 4,
                //                 ),
                //                 Text("${restaurant?.city}, ${restaurant?.state}",
                //                     style: const TextStyle(
                //                       fontSize: 13,
                //                       color: Colors.black,
                //                       fontWeight: FontWeight.w400,
                //                     )),
                //               ],
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                // ),
                //
                //   ]),
                //   SizedBox(
                //       width: double.infinity,
                //       height: 84,
                //       child: createAppBar(context)),
              ],
            ),
          ),
        );
      },
    );
  }
}
