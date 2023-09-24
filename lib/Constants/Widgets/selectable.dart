import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:flutter/material.dart';

class Selectable extends StatelessWidget {
  Selectable(
      {super.key, required this.text, this.selected = false, this.number = 0});
  int number = 0;
  String text;
  bool selected;
  @override
  Widget build(BuildContext context) {
    return selected
        ? Container(
            padding: const EdgeInsets.all(8),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFF544C68),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF5E3DB2)),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${text} ',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  child: (number == 0)
                      ? null
                      : Container(
                          width: 17,
                          height: 17,
                          child: Center(
                            child: Container(
                              width: 5,
                              height: 14,
                              child: Center(
                                child: Text(
                                  '${number}',
                                  style: const TextStyle(
                                    color: Color(0xFF323232),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          decoration: const ShapeDecoration(
                            color: Color(0xFF43FF8E),
                            shape: OvalBorder(),
                          ),
                        ),
                )
              ],
            ),
          )
        : Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFCFCFC),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 0.50, color: AppColor.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        color: Color(0xFF9997A1),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
