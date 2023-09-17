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
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return Column(
                  children:
                      //[
                      //   ListView.builder(
                      //       itemCount: snapshot.data!.docs.length,
                      //       itemBuilder: (context, index) {
                      //         final reversedIndex =
                      //             snapshot.data!.docs.length - 1 - index;
                      //         final doc = snapshot.data!.docs[reversedIndex];
                      //         return ExpansionTile(
                      //           initiallyExpanded: true,
                      //           title: Text(doc.id),
                      //           children: List.generate(
                      //             doc.data()["order"].length,
                      //             (i) => Padding(
                      //               padding:
                      //                   const EdgeInsets.symmetric(vertical: 8.0),
                      //               child: OrderItem(
                      //                 index: i,
                      //                 order: doc.data()["order"][i],
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       })
                      // ]

                      List.generate(snapshot.data!.docs.length, (index) {
                    final reversedIndex =
                        snapshot.data!.docs.length - 1 - index;
                    return ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(snapshot.data!.docs[reversedIndex].id),
                      children: List.generate(
                          snapshot.data!.docs[reversedIndex]
                              .data()["order"]
                              .length,
                          (i) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: OrderItem(
                                  index: i,
                                  order: snapshot.data!.docs[reversedIndex]
                                      .data()["order"][i],
                                ),
                              )),
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
