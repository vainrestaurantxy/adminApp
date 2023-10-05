import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton(
      {super.key, this.text, this.disabled = false, this.width = 396});
  String? text;
  bool disabled;
  int width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      //    height: 53.h,
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: disabled ? AppColor.disabledColor : AppColor.purpleColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Center(
        child: Text(
          '$text',
          style: AppTypography.smallText
              .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}
