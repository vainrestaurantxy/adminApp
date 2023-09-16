import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

createAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    title: Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Text("DINE",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ))
      ],
    ),
  );
}
