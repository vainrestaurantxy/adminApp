import 'package:flutter/material.dart';

createAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        Image.asset(
          'assets/Logo Feast.png',
          height: 30,
          // width: 200,
        ),
        const Text("Feast",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ))
      ],
    ),
  );
}
