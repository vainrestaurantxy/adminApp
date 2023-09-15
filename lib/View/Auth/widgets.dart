import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/Colors/colors.dart';
import '../../Constants/Typography/typography.dart';

Widget header({String text = "RestaurantXY"}) {
  return SizedBox(
    width: 428.w,
    height: 344.h,
    child: Stack(children: [
      SizedBox(
          width: 428.w,
          height: 344.h,
          child: Image.asset(
            "assets/authImage.png",
            fit: BoxFit.cover,
          )),
      Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center)),
      ),
      Positioned(
        left: 16,
        bottom: 16,
        child: Text(
          "$text",
          style: AppTypography.heading.merge(GoogleFonts.bebasNeue()),
        ),
      )
    ]),
  );
}

Widget createButton(
    {required String heading, required String subtitle, required Color color}) {
  return Container(
    width: 396.w,
    height: 83.h,
    padding: const EdgeInsets.all(16),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 51.h,
          height: 51.h,
          decoration: const ShapeDecoration(
            color: AppColor.grey,
            shape: OvalBorder(),
          ),
        ),
        SizedBox(width: 10.w),
        SizedBox(
          height: 51.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$heading',
                  style:
                      AppTypography.largeText.copyWith(color: AppColor.white)),
              Text(
                '$subtitle',
                style: AppTypography.smallText.copyWith(
                    color: AppColor.white, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
