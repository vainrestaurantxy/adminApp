import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Data/Providers/cartProvider.dart';
import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Data/Providers/restaurantProvider.dart';
import 'package:admin_app/Model/RestaurantMenu/restaurantMenu.dart';
import 'package:admin_app/View/Home/OrderPage/CreateOrder/item.dart';
import 'package:admin_app/ViewModel/HomeViewModel/orderViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../Model/Order/order.dart';

class EditItem extends StatelessWidget {
  EditItem(
      {super.key, required this.table, this.name, this.phone, this.orderNo});
  int table;
  int? orderNo;
  String? name;
  String? phone;

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<OrderViewModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 396.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Edit Order',
                      style: AppTypography.largeText
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 396.w,
                      child: Text(
                        'Add or remove items from existing order. This will update the order status to unpaid and undelivered',
                        style: AppTypography.smallText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Consumer<CartProvider>(
                builder: (_, ref, __) {
                  return Container(
                    width: 396.w,
                    padding: const EdgeInsets.all(16),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFE0E6ED)),
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
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 324.w,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 203.w,
                                                      child: Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            const TextSpan(
                                                              text:
                                                                  'Table Number: ',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFF3B3F5C),
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: '${table}',
                                                              style:
                                                                  const TextStyle(
                                                                color: Color(
                                                                    0xFF53389E),
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                        SizedBox(width: 16.w),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 233.w,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Customer Name: ',
                                                        style: AppTypography
                                                            .smallText,
                                                      ),
                                                      TextSpan(
                                                        text: '\n',
                                                        style: AppTypography
                                                            .smallText
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: AppColor
                                                                    .purpleColor),
                                                      ),
                                                      TextSpan(
                                                        text:
                                                            'Customer Contact:',
                                                        style: AppTypography
                                                            .smallText,
                                                      ),
                                                      TextSpan(
                                                        text: phone,
                                                        style: AppTypography
                                                            .smallText
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: AppColor
                                                                    .purpleColor),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                        Consumer<CartProvider>(
                          builder: (_, ref, __) {
                            return Column(
                              children: [
                                ...List.generate(ref.menuCart.length, (index) {
                                  return Item(
                                    image: ref.menuCart[index].image,
                                    quantity: ref.cart,
                                    name: ref.menuCart[index].name,
                                    price: ref.menuCart[index].price,
                                    menu: ref.menuCart[index],
                                  );
                                }),
                                const SizedBox(
                                  height: 8,
                                ),
                                // Divider(
                                //   height: 1,
                                //   thickness: double.infinity,
                                //   color: AppColor.grey,
                                // ),
                                SizedBox(
                                  width: double.infinity,
                                  child: (ref.menuCart.length == 0)
                                      ? const SizedBox()
                                      : Container(
                                          width: 364.w,
                                          height: 88.h,
                                          padding:
                                              const EdgeInsets.only(top: 8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColor.white,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  child: Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        const TextSpan(
                                                          text: 'Order Total:',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF3B3F5C),
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' ${ref.getTotal()} AED\n',
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF3B3F5C),
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                          text: 'Tax (5%):',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF3B3F5C),
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' ${ref.getTotal() * 0.05} AED\n',
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF3B3F5C),
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                          text: 'Discount:',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF3B3F5C),
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ' ${ref.getDiscount()} AED\n',
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF3B3F5C),
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        const TextSpan(
                                                          text: 'Total: ',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF3B3F5C),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              '${(ref.getTotal() + ref.getTotal() * 0.05) - ref.getDiscount()} AED',
                                                          style:
                                                              const TextStyle(
                                                            color: Color(
                                                                0xFF53389E),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w600,
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
                                ),
                                SizedBox(
                                    child: ref.menuCart.length == 0
                                        ? const SizedBox()
                                        : GestureDetector(
                                            onTap: () async {
                                              Order order = Order(
                                                  items: ref.menuCart,
                                                  contactNo: phone,
                                                  customerName: name,
                                                  quanntity: ref.cart,
                                                  price: ref.getTotal(),
                                                  tax: ref.getTotal() * 0.05,
                                                  discount: ref.getDiscount(),
                                                  totalPrice: (ref.getTotal() +
                                                          ref.getTotal() *
                                                              0.05) -
                                                      ref.getDiscount(),
                                                  orderStatus:
                                                      "Order Confirmed",
                                                  tableNo: table);
                                              viewModel.updateOrder(
                                                  order, orderNo);
                                              Navigator.pop(context);
                                            },
                                            child: PrimaryButton(
                                                text: "Update Order")))
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Consumer<RestaurantData>(
                builder: (_, ref, __) {
                  List<RestaurantMenu?> list = ref.restaurant?.menu ?? [];
                  return Consumer<ErrorProvider>(
                    builder: (_, search, __) {
                      return Column(
                        children: [
                          CustomTextField(
                            hintText: "Search in Menu",
                            onChanged: (v) {
                              list = ref.restaurant!.menu!.map((e) {
                                if (e.name!
                                        .toLowerCase()
                                        .contains(v.toLowerCase()) ||
                                    e.category!
                                        .toLowerCase()
                                        .contains(v.toLowerCase()) ||
                                    e.description!
                                        .toLowerCase()
                                        .contains(v.toLowerCase()) ||
                                    e.itemType!
                                        .toLowerCase()
                                        .contains(v.toLowerCase())) {
                                  return e;
                                }
                              }).toList();
                              while (list.remove(null));
                              search.notifyListeners();
                              print(list);
                            },
                          ),
                          Column(
                            children: List.generate(
                                list.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 16),
                                      child: Item(
                                        quantity: {},
                                        name: list[index]!.name,
                                        price: list[index]!.price,
                                        image: list[index]!.image,
                                        menu: list[index],
                                      ),
                                    )),
                          )
                        ],
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
