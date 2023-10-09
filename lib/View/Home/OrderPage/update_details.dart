import 'dart:developer';

import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Constants/staticConstants.dart';
import 'package:admin_app/Data/Providers/cartProvider.dart';
import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Model/RestaurantMenu/restaurantMenu.dart';
import 'package:admin_app/View/Home/OrderPage/CreateOrder/addItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../Model/Order/order.dart';
import '../../../ViewModel/HomeViewModel/orderViewModel.dart';

class UpdateDetails extends StatelessWidget {
  final viewModel = GetIt.instance<OrderViewModel>();
  UpdateDetails(
      {super.key,
      required this.tablenumber,
      required this.namee,
      required this.number,
      required this.orders,
      required this.docDate,
      required this.index});

  int tablenumber;
  String namee;
  String number;
  String docDate;
  int index;
  Map<String, dynamic> orders;

  Future getName(String name, String phone, int tableNo) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("Restaurants")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Orders')
        .doc(docDate)
        .get();
    final data = snapshot.data();
    final List<dynamic> order = data?['order'];

    for (var map in order) {
      if (map['customerName'] != null) {
        map['customerName'] = namee;
        map['contactNo'] = number;
        map['tableNo'] = tablenumber;
      }
    }

    await FirebaseFirestore.instance
        .collection("Restaurants")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Orders')
        .doc(docDate)
        .update({'order': order});

    print(order);
    print(order[index]['customerName']);
    print('changedName $namee');
    print(order[index]['contactNo']);
    print(order[index]['tableNo']);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController tableno =
        TextEditingController(text: tablenumber.toString());

    TextEditingController name = TextEditingController(text: namee.toString());

    TextEditingController phone =
        TextEditingController(text: number.toString());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(child: Consumer<ErrorProvider>(
            builder: (_, ref, __) {
              return Column(
                children: [
                  Container(
                    width: 396.h,
                    height: 51.h,
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Edit Customer Details',
                          style: AppTypography.largeText
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 396.w,
                          child: Text(
                            'Update customer details to proceed',
                            style: AppTypography.smallText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    onChanged: (p0) {
                      tablenumber = int.parse(p0);
                    },
                    controller: tableno,
                    errorText: ref.price,
                    hintText: 'Ex. 12',
                    label: const Text("Table Number"),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    onChanged: (p0) {
                      namee = p0;
                    },
                    errorText: ref.restaurantName,
                    controller: name,
                    hintText: 'Enter Name',
                    label: const Text("Customer Name"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    onChanged: (p0) {
                      number = p0;
                    },
                    errorText: ref.phoneNo,
                    controller: phone,
                    hintText: 'Enter Number',
                    label: const Text("Customer Mobile"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (name.text.isNotEmpty) {
                        ref.validaterestaurantName(name.text);
                      }
                      ref.validateprice(tableno.text);
                      if (phone.text.isNotEmpty) {
                        ref.validatePhoneNo(phone.text);
                      }

                      if (ref.restaurantName == null &&
                          ref.phoneNo == null &&
                          ref.price == null) {
                        Provider.of<CartProvider>(context, listen: false).cart =
                            {};
                        Provider.of<CartProvider>(context, listen: false)
                            .menuCart = [];
                        // Order order = Order(
                        //     contactNo: number,
                        //     customerName: namee,
                        //     tableNo: tablenumber,
                        //     discount: orders['discount'],
                        //     items: orders['items'],
                        //     orderNo: orders['orderNo'],
                        //     orderStatus: orders['orderStatus'],
                        //     price: orders['price'],
                        //     quanntity: orders['quanntity'],
                        //     tax: orders['tax'],
                        //     totalPrice: orders['totalPrice']);
                        // viewModel.saveOrder(order, context);
                        getName(namee, number, tablenumber);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      }
                    },
                    child: PrimaryButton(
                      text: "Update & Go Back",
                    ),
                  ),
                ],
              );
            },
          ))),
    );
  }
}
