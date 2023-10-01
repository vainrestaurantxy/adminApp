import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Model/Restaurant/restaurant.dart';
import '../../../ViewModel/HomeViewModel/menuPageViewModel.dart';
import 'package:provider/provider.dart' as prov;

Widget createCustomSliverAppBar({
  required Restaurant restaurant,
  ScrollController? controller,
}) {
  List<String> genre = [
    'Veg',
    'Non Veg',
  ];
  Widget customSliverAppBar = SliverAppBar(
    leading: const Icon(null),
    floating: false,
    expandedHeight: 530,
    elevation: 0,
    pinned: true,
    collapsedHeight: 250,
    flexibleSpace: FlexibleSpaceBar(
      expandedTitleScale: 1,
      titlePadding: const EdgeInsets.all(0),
      title: prov.Consumer<MenuPageViewModel>(
        builder: (_, provider, __) {
          return Container(
            color: Colors.white,
            width: double.infinity,
            height: 300.h,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Container(
                    width: 396.w,
                    // height: 60.h,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: AppColor.white,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: AppColor.blackText,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 352.w,
                          child: Text(
                            'Preview: Your restaurant’s menu will look like this to the customers :P',
                            textAlign: TextAlign.center,
                            style: AppTypography.smallText
                                .copyWith(color: AppColor.blackText),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //     width: double.infinity,
                  // child: TextFormField(
                  //   decoration: InputDecoration(
                  //     hintText: "Search in Menu",
                  //     disabledBorder: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(color: Color(0xFFF4F4FF), width: 0),
                  //         borderRadius: BorderRadius.all(Radius.circular(12))),
                  //     enabledBorder: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(color: Color(0xFFF4F4FF), width: 0),
                  //         borderRadius: BorderRadius.all(Radius.circular(12))),
                  //     errorBorder: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(color: Color(0xFFF4F4FF), width: 0),
                  //         borderRadius: BorderRadius.all(Radius.circular(12))),
                  //     border: OutlineInputBorder(
                  //         borderSide:
                  //             BorderSide(color: Color(0xFFF4F4FF), width: 0),
                  //         borderRadius: BorderRadius.all(Radius.circular(12))),
                  //     filled: true,
                  //     fillColor: Color(0xFFF4F4FF),
                  //   ),
                  // )),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Categories & Filters',
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 32.h,
                    width: double.infinity,
                    child: Center(
                      child: ListView.builder(
                        itemCount:
                            (MenuPageViewModel.tags.length ?? 0) + genre.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return prov.Consumer<MenuPageViewModel>(
                            builder: (context, ref, child) {
                              if (index < genre.length) {
                                return GestureDetector(
                                  onTap: () {
                                    // print("filter");
                                    if (index == 0) {
                                      if (MenuPageViewModel.tag == "Veg") {
                                        ref.selectedFilterIndex = -1;
                                        MenuPageViewModel.tag = "";
                                      } else {
                                        ref.selectedFilterIndex = 0;
                                        MenuPageViewModel.tag = "Veg";
                                      }
                                    } else if (index == 1) {
                                      if (MenuPageViewModel.tag == "Non Veg") {
                                        ref.selectedFilterIndex = -1;
                                        MenuPageViewModel.tag == "";
                                      } else {
                                        ref.selectedFilterIndex = 1;
                                        MenuPageViewModel.tag = "Non Veg";
                                      }
                                    }
                                    ref.notifyListeners();
                                    // final provider =
                                    //     prov.Provider.of<RestaurantBuilder>(
                                    //         context,
                                    //         listen: false);
                                    // provider.notifyListeners();
                                    // log('anything? hui');
                                    // Scrollable.ensureVisible(MenuPageViewModel
                                    //     .keys[index].currentContext!);
                                    // controller?.scrollTo(
                                    //     index: stamps?[provider.tags[index]] ?? 0,
                                    //     duration: const Duration(seconds: 1));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4),
                                      decoration: BoxDecoration(
                                          color:
                                              ref.selectedFilterIndex == index
                                                  ? const Color(0xff323232)
                                                  : Colors.transparent,
                                          border: Border.all(
                                              color: const Color(0xFFF4F4FF)),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        children: [
                                          ref.selectedFilterIndex != index
                                              ? SvgPicture.asset(
                                                  "assets/fastfood.svg",
                                                  width: 20,
                                                  height: 20,
                                                )
                                              : Image.asset(
                                                  'assets/fastfoodwhite.png',
                                                  height: 20,
                                                  width: 20,
                                                ),
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
                              } else {
                                final resIndex = index - genre.length;
                                return GestureDetector(
                                  onTap: () {
                                    // print(MenuPageViewModel.keys);
                                    ref.selectedFilterIndex = -1;
                                    // ref.notifyListeners();
                                    Scrollable.ensureVisible(MenuPageViewModel
                                        .keys[MenuPageViewModel.tags[resIndex]]!
                                        .currentContext!);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 4),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xFFF4F4FF)),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/fastfood.svg",
                                            width: 20,
                                            height: 20,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(MenuPageViewModel.tags[resIndex],
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          );

                          // GestureDetector(
                          //   onTap: () {
                          //     Scrollable.ensureVisible(
                          //         MenuPageViewModel.keys[index].currentContext!);
                          //     // controller?.scrollTo(
                          //     //     index: stamps?[provider.tags[index]] ?? 0,
                          //     //     duration: const Duration(seconds: 1));
                          //   },
                          //   child: Padding(
                          //     padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          //     child: Container(
                          //       padding: const EdgeInsets.symmetric(
                          //           horizontal: 8.0, vertical: 10),
                          //       decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           border:
                          //               Border.all(color: const Color(0xFFF4F4FF)),
                          //           borderRadius: BorderRadius.circular(4)),
                          //       child: Row(
                          //         children: [
                          //           Column(children: [
                          //             SvgPicture.asset(
                          //               "assets/fastfood.svg",
                          //               width: 20.w,
                          //               height: 20.w,
                          //             ),
                          //           ]),
                          //           SizedBox(
                          //             width: 10.w,
                          //           ),
                          //           Text(provider.tags![index],
                          //               style: AppTypography.smallText)
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      collapseMode: CollapseMode.parallax,
      background: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                  Color(int.parse(restaurant.color ?? '0xFFFFD79A')),
                  Colors.white
                ])),
          ),
          SizedBox(
            width: double.infinity,
            height: 0.5.sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  height: 50,
                  child: Image.network(restaurant.logo!),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(restaurant.name!,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(
                  height: 4,
                ),
                Text("${restaurant.city}, ${restaurant.state}",
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
    ),
  );

  return customSliverAppBar;
}
