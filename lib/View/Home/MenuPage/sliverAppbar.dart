import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Model/Restaurant/restaurant.dart';
import '../../../ViewModel/HomeViewModel/menuPageViewModel.dart';

Widget createCustomSliverAppBar({
  required Restaurant restaurant,
  ScrollController? controller,
}) {
  Widget customSliverAppBar = SliverAppBar(
    leading: const Icon(null),
    floating: false,
    expandedHeight: 450,
    elevation: 0,
    pinned: true,
    collapsedHeight: 180,
    flexibleSpace: FlexibleSpaceBar(
      expandedTitleScale: 1,
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        color: Colors.white,
        width: double.infinity,
        height: 175.h,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Container(
                width: 396.w,
                height: 60.h,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      blurRadius: 16,
                      offset: Offset(0, 8),
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

              SizedBox(
                height: 32.h,
                width: double.infinity,
                child: Center(
                  child: ListView.builder(
                    itemCount: restaurant.tags?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(
                            MenuPageViewModel.keys[index].currentContext!);
                        // controller?.scrollTo(
                        //     index: stamps?[restaurant.tags[index]] ?? 0,
                        //     duration: const Duration(seconds: 1));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: const Color(0xFFF4F4FF)),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: [
                              Column(children: [
                                SvgPicture.asset(
                                  "assets/fastfood.svg",
                                  width: 20.w,
                                  height: 20.w,
                                ),
                              ]),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(restaurant.tags![index],
                                  style: AppTypography.smallText)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
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
