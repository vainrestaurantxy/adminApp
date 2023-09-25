import 'package:admin_app/Data/Providers/cartProvider.dart';
import 'package:admin_app/View/Home/OrderPage/CreateOrder/addbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../Model/RestaurantMenu/restaurantMenu.dart';

class Item extends StatelessWidget {
  Item(
      {super.key,
      this.name,
      this.price,
      this.image,
      required this.quantity,
      this.menu,
      this.itemButton = true});
  String? name;
  int? price;
  bool itemButton;
  Map<String, dynamic> quantity;
  String? image;
  RestaurantMenu? menu;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 43.h,
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 43.w,
                    height: 43.w,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Image.network(
                      image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  SizedBox(
                    width: 253.w / 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 297.w / 2,
                          child: Text(
                            '${name}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Text(
                              'AED ${price}      ',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              child:
                                  quantity[name] == null || quantity[name] == 0
                                      ? const SizedBox()
                                      : Text(
                                          'Qty: ${quantity[name]} ',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              SizedBox(
                child: itemButton
                    ? Consumer<CartProvider>(
                        builder: (_, ref, __) {
                          return getAddButton(
                              code: name!, ref: ref, menu: menu!);
                        },
                      )
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
