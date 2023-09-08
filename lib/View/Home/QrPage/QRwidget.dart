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
      height: 190.w,
      width: 190.w,
      child: Column(
        children: [
          QRCode(data: "${id}/${index + 1}"),
        ],
      ),
    );
  }
}
