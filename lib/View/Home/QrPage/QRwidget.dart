import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_bar_code/qr/src/qr_code.dart';

class QR extends StatelessWidget {
  QR({super.key, required this.index, required this.id});
  int index;
  String id;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: AppColor.grey,
          )),
      height: 190.w,
      width: 190.w,
      child: Column(
        children: [
          QRCode(
              data:
                  "https://customer.feastdubai.com/#/menu/${id}/table/${index + 1}"),
        ],
      ),
    );
  }
}
