import 'dart:developer';

import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';

import 'package:admin_app/View/Home/OrderPage/CreateOrder/createOrder.dart';

import 'package:admin_app/View/Home/OrderPage/orderItem.dart';
import 'package:admin_app/ViewModel/HomeViewModel/orderViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../../Model/Order/order.dart' as order;

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<OrderViewModel>();
    viewModel.getOrder(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 396.w,
              height: 51.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Orders',
                    style: AppTypography.largeText
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 396.w,
                    child: Text(
                      'View and manage your restaurant’s order',
                      style: AppTypography.smallText,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateOrder(),
                    ));
              },
              child: PrimaryButton(
                text: "Create New Order",
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Restaurants")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection("Orders")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                //  print(snapshot.connectionState);
                return Column(
                  children:
                      List.generate(snapshot.data?.docs.length ?? 0, (index) {
                    var reversedIndex = snapshot.data!.docs.length - 1 - index;
                    if (reversedIndex == -1) {
                      reversedIndex = 0;
                    }
                    List<dynamic>? orders =
                        snapshot.data?.docs[reversedIndex].data()["order"];
                    // if (orders![reversedIndex]['customerName'] == '') {
                    //   print('null name');
                    // } else {
                    //   print(orders![reversedIndex]['customerName']);
                    // }
                    if (orders == null || orders.isEmpty) {
                      return Container(); // Handle empty or null orders.
                    }

                    orders.sort((b, a) {
                      return int.parse(a["orderNo"].toString())
                          .compareTo(int.parse(b["orderNo"].toString()));
                    });

                    return ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(snapshot.data!.docs[reversedIndex].id),
                      children: List.generate(orders.length, (i) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: OrderItem(
                            index: i,
                            order: orders[i],
                            docDate: snapshot.data!.docs[reversedIndex].id,
                          ),
                        );
                      }),
                    );
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
