import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Colors/colors.dart';
import '../Typography/typography.dart';

class SecondaryButton extends StatelessWidget {
  SecondaryButton(
      {super.key,
      required this.text,
      this.disabled = false,
      this.width = 396,
      this.borderColor = AppColor.grey});
  String text;
  bool disabled;
  int width;
  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      //  height: 53.h,
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTypography.smallText.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
