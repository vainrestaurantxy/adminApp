import 'dart:developer';

import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Data/Providers/cartProvider.dart';
import 'package:admin_app/Model/RestaurantMenu/restaurantMenu.dart';
import 'package:admin_app/View/Home/OrderPage/CreateOrder/item.dart';
import 'package:admin_app/View/Home/OrderPage/editItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OrderItem extends StatelessWidget {
  OrderItem(
      {super.key,
      required this.order,
      required this.index,
      required this.docDate});
  Map<String, dynamic> order;
  int index;
  String docDate;
//int orderItemRate
  @override
  Widget build(BuildContext context) {
    // print(order);
    double price = order['price'];
    double tax = order['tax'];
    double discount = order['discount'];
    double totalPrice = order['totalPrice'];

    final today =
        '${DateTime.now().toUtc().day}|${DateTime.now().toUtc().month}|${DateTime.now().toUtc().year}';
    print('today $today');

    Future<String> getlatestDate() async {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("Restaurants")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Orders")
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // The document.id contains the name of the document
        print(
            'todayDoc ${querySnapshot.docs[querySnapshot.docs.length - 1].id}');
        return querySnapshot.docs[querySnapshot.docs.length - 1].id;
      } else {
        // Return an appropriate value or handle the case where no documents are found
        return ""; // You can change this to suit your needs
      }
    }

    return Container(
      width: 396.w,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE0E6ED)),
          borderRadius: BorderRadius.circular(11),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0xFFD3DAE2),
            blurRadius: 14,
            offset: Offset(0, 7),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 85.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 396.w,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFE7E7FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Order ID:',
                                    style: TextStyle(
                                      color: Color(0xFF323232),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                      color: Color(0xFF323232),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: order["orderNo"]!.toString(),
                                    style: const TextStyle(
                                      color: Color(0xFF53389E),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(width: 139.w),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: ShapeDecoration(
                                
                                color:
                                    (order["orderStatus"] ==
                                                "Order Confirmed" ||
                                            order["orderStatus"] ==
                                                "Order Delivered" ||
                                            order["orderStatus"] ==
                                                "Order Paid")
                                        ? AppColor.purpleColor
                                        : Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 0.50, color: Color(0xFF241D43)),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap:
                                        (order["orderStatus"] ==
                                                    "Order Confirmed" ||
                                                order["orderStatus"] ==
                                                    "Order Delivered" ||
                                                order["orderStatus"] ==
                                                    "Order Paid")
                                            ? null
                                            : () async {
                                                DocumentSnapshot<
                                                        Map<String,
                                                            dynamic>>
                                                    data =
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection(
                                                            "Restaurants")
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)
                                                        .collection("Orders")
                                                        .doc(
                                                            '${DateTime.now().toUtc().day}|${DateTime.now().toUtc().month}|${DateTime.now().toUtc().year}')
                                                        .get();

                                                Map<String, dynamic>? json =
                                                    data.data();

                                                json!["order"][index]
                                                        ["orderStatus"] =
                                                    "Order Confirmed";

                                                await FirebaseFirestore.instance
                                                    .collection("Restaurants")
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.uid)
                                                    .collection("Orders")
                                                    .doc(
                                                        '${DateTime.now().toUtc().day}|${DateTime.now().toUtc().month}|${DateTime.now().toUtc().year}')
                                                    .set(json);
                                              },
                                    child: Container(
                                      width: 18.w,
                                      height: 18.w,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color:
                                            (order["orderStatus"] ==
                                                        "Order Confirmed" ||
                                                    order["orderStatus"] ==
                                                        "Order Delivered" ||
                                                    order["orderStatus"] ==
                                                        "Order Paid")
                                                ? AppColor.purpleColor
                                                : Colors.white,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          color:
                                              (order["orderStatus"] ==
                                                          "Order Confirmed" ||
                                                      order["orderStatus"] ==
                                                          "Order Delivered" ||
                                                      order["orderStatus"] ==
                                                          "Order Paid")
                                                  ? AppColor.white
                                                  : AppColor.purpleColor,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: (order["orderStatus"] ==
                                          "Order Delivered" ||
                                      order["orderStatus"] == "Order Paid")
                                  ? null
                                  : () async {
                                      DocumentSnapshot<Map<String, dynamic>>
                                          data = await FirebaseFirestore
                                              .instance
                                              .collection("Restaurants")
                                              .doc(FirebaseAuth
                                                  .instance.currentUser!.uid)
                                              .collection("Orders")
                                              .doc(
                                                  '${DateTime.now().toUtc().day}|${DateTime.now().toUtc().month}|${DateTime.now().toUtc().year}')
                                              .get();

                                      Map<String, dynamic>? json = data.data();

                                      json!["order"][index]["orderStatus"] =
                                          "Order Delivered";

                                      await FirebaseFirestore.instance
                                          .collection("Restaurants")
                                          .doc(FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .collection("Orders")
                                          .doc(
                                              '${DateTime.now().toUtc().day}|${DateTime.now().toUtc().month}|${DateTime.now().toUtc().year}')
                                          .set(json);
                                    },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: (order["orderStatus"] ==
                                              "Order Delivered" ||
                                          order["orderStatus"] == "Order Paid")
                                      ? AppColor.purpleColor
                                      : AppColor.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 1, color: Color(0xFF241C43)),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 18.w,
                                      height: 18.w,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Center(
                                        child: Icon(
                                          Icons.room_service_outlined,
                                          color: (order["orderStatus"] ==
                                                      "Order Delivered" ||
                                                  order["orderStatus"] ==
                                                      "Order Paid")
                                              ? AppColor.white
                                              : AppColor.purpleColor,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            GestureDetector(
                              onTap: (order["orderStatus"] == "Order Paid")
                                  ? null
                                  : () async {
                                      DocumentSnapshot<Map<String, dynamic>>
                                          data = await FirebaseFirestore
                                              .instance
                                              .collection("Restaurants")
                                              .doc(FirebaseAuth
                                                  .instance.currentUser!.uid)
                                              .collection("Orders")
                                              .doc(
                                                  '${DateTime.now().toUtc().day}|${DateTime.now().toUtc().month}|${DateTime.now().toUtc().year}')
                                              .get();
                                      Map<String, dynamic>? json = data.data();
                                      json!["order"][index]["orderStatus"] =
                                          "Order Paid";
                                      //  print(json);
                                      await FirebaseFirestore.instance
                                          .collection("Restaurants")
                                          .doc(FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .collection("Orders")
                                          .doc(
                                              '${DateTime.now().toUtc().day}|${DateTime.now().toUtc().month}|${DateTime.now().toUtc().year}')
                                          .set(json);
                                    },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: (order["orderStatus"] == "Order Paid")
                                      ? AppColor.purpleColor
                                      : AppColor.white,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 1, color: Color(0xFF241C43)),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 18.w,
                                      height: 18.w,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child: Center(
                                        child: Icon(
                                          Icons.attach_money,
                                          size: 18,
                                          color: (order["orderStatus"] ==
                                                  "Order Paid")
                                              ? AppColor.white
                                              : AppColor.purpleColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  height: 40.h,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Table Number: ',
                                style: TextStyle(
                                  color: Color(0xFF3B3F5C),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: order["tableNo"].toString(),
                                style: const TextStyle(
                                  color: Color(0xFF53389E),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      SizedBox(
                        width: 147.w,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Status:',
                                style: TextStyle(
                                  color: Color(0xFF323232),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  color: Color(0xFF323232),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: order["orderStatus"],
                                style: const TextStyle(
                                  color: Color(0xFF53389E),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          // width: double.infinity,
                          child: Column(
                        children:
                            List.generate(order["items"]?.length ?? 0, (index) {
                          RestaurantMenu menu =
                              RestaurantMenu.fromJson(order["items"]?[index]);
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SizedBox(
                              width: 396.w,
                              child: Item(
                                quantity: order['quanntity'],
                                itemButton: false,
                                name: order["items"]?[index]['name'],
                                image: order["items"]?[index]['image'],
                                menu: menu,
                                price: order["items"]![index]['price'],
                              ),
                            ),
                          );
                        }),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.white,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Order Total:',
                            style: TextStyle(
                              color: Color(0xFF3B3F5C),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' ${price.toStringAsFixed(2)} AED\n',
                            style: const TextStyle(
                              color: Color(0xFF3B3F5C),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const TextSpan(
                            text: 'Tax (5%):',
                            style: TextStyle(
                              color: Color(0xFF3B3F5C),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' ${tax.toStringAsFixed(2)} AED\n',
                            style: const TextStyle(
                              color: Color(0xFF3B3F5C),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const TextSpan(
                            text: 'Discount :',
                            style: TextStyle(
                              color: Color(0xFF3B3F5C),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' ${discount.toStringAsFixed(2)} AED\n',
                            style: const TextStyle(
                              color: Color(0xFF3B3F5C),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const TextSpan(
                            text: 'Total: ',
                            style: TextStyle(
                              color: Color(0xFF3B3F5C),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: '${totalPrice.toStringAsFixed(2)} AED',
                            style: const TextStyle(
                              color: Color(0xFF53389E),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 235.w,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              order["customerName"] != ''
                                  ? const TextSpan(
                                      text: 'Customer Name:',
                                      style: TextStyle(
                                        color: Color(0xFF323232),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : const TextSpan(),
                              const TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  color: Color(0xFF323232),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '${order["customerName"]}\n',
                                style: const TextStyle(
                                  color: Color(0xFF53389E),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              order["contactNo"] != ''
                                  ? const TextSpan(
                                      text: 'Customer Contact:',
                                      style: TextStyle(
                                        color: Color(0xFF323232),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : const TextSpan(),
                              const TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  color: Color(0xFF323232),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '${order["contactNo"]}',
                                style: const TextStyle(
                                  color: Color(0xFF53389E),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                today == docDate
                    ? GestureDetector(
                        onTap: () {
                          final ref =
                              Provider.of<CartProvider>(context, listen: false);

                          dynamic da = order["quanntity"];

                          ref.cart = Map<String, int>.from(order["quanntity"]);
                          List<dynamic> list = order['items'];
                          ref.menuCart = list
                              .map((e) => RestaurantMenu.fromJson(e))
                              .toList();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditItem(
                                        table: order["tableNo"],
                                        name: order["customerName"],
                                        phone: order["contactNo"],
                                        orderNo: order["orderNo"],
                                      )));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF241C43),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 18.w,
                                height: 18.w,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(),
                                child: const Center(
                                  child: Icon(Icons.add,
                                      color: AppColor.white, size: 18),
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'Edit Items',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 18,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
