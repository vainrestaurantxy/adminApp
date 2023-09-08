import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key, this.name, this.selected = false});
  String? name;
  bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 396.w,
      height: 55.h,
      padding: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: selected ? AppColor.purpleColor : AppColor.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColor.grey),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: name,
                  style: AppTypography.smallText.copyWith(
                      color: selected ? AppColor.white : AppColor.blackText),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
