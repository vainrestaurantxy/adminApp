import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/View/Home/OrderPage/CreateOrder/addItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CreateOrder extends StatelessWidget {
  CreateOrder({super.key});
  TextEditingController tableno = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(child: Consumer<ErrorProvider>(
            builder: (_, ref, __) {
              return Column(
                children: [
                  Container(
                    width: 396.h,
                    height: 51.h,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create New Order',
                          style: AppTypography.largeText
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 396.w,
                          child: Text(
                            'Add customer details to proceed',
                            style: AppTypography.smallText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    controller: tableno,
                    errorText: ref.price,
                    hintText: 'Ex. 12',
                    label: Text("Table Number"),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    errorText: ref.restaurantName,
                    controller: name,
                    hintText: 'Enter Name',
                    label: Text("Customer Name"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    errorText: ref.phoneNo,
                    controller: phone,
                    hintText: 'Enter Number',
                    label: Text("Customer Mobile"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (name.text.isNotEmpty) {
                        ref.validaterestaurantName(name.text);
                      }
                      ref.validateprice(tableno.text);
                      if (phone.text.isNotEmpty)
                        ref.validatePhoneNo(phone.text);
                      if (ref.restaurantName == null &&
                          ref.phoneNo == null &&
                          ref.price == null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddItemOrder(
                                  table: int.parse(tableno.text),
                                  name: name.text,
                                  phone: phone.text),
                            ));
                      }
                    },
                    child: PrimaryButton(
                      text: "Save & Go to Menu",
                    ),
                  ),
                ],
              );
            },
          ))),
    );
  }
}
