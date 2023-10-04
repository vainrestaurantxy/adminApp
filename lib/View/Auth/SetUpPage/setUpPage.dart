import 'dart:developer';

import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Model/Restaurant/restaurant.dart';
import 'package:admin_app/View/Auth/widgets.dart';
import 'package:admin_app/ViewModel/AuthViewModel/SetupViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:random_string_generator/random_string_generator.dart';

import '../../../Data/Providers/restaurantProvider.dart';

class SetUpPage extends StatelessWidget {
  SetUpPage({super.key});

  TextEditingController restaurantName = TextEditingController();

  TextEditingController restaurantState = TextEditingController();

  TextEditingController restaurantCity = TextEditingController();

  TextEditingController phoneno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<SetupViewModel>();
    final data = Provider.of<RestaurantData>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(
                text: "setup ${data.isClub ? "CLUB" : "RESTAURANT"} account"
                    .toUpperCase()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Consumer<ErrorProvider>(
                builder: (_, ref, __) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 28,
                      ),
                      CustomTextField(
                        errorText: ref.restaurantName,
                        controller: restaurantName,
                        hintText: "Enter Name",
                        label:
                            Text("${data.isClub ? "Club" : "Restaurant"} Name"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        errorText: ref.restaurantCity,
                        controller: restaurantCity,
                        hintText: "Enter City",
                        label:
                            Text("${data.isClub ? "Club" : "Restaurant"} City"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
<<<<<<< Updated upstream
                        errorText: ref.restaurantState,
=======
                        errorText: ref.restaurantAddress,
>>>>>>> Stashed changes
                        hintText: "Enter Address",
                        controller: restaurantState,
                        label: Text(
                            "${data.isClub ? "Club" : "Restaurant"} Address"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        errorText: ref.phoneNo,
                        hintText: "Enter Number",
                        controller: phoneno,
                        keyboardType: TextInputType.phone,
                        prefix: Text("+971  "),
                        label: Text(
                            "${data.isClub ? "Club" : "Restaurant"} Contact"),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (viewModel.validate(
                              restaurantName: restaurantName.text,
                              restaurantCity: restaurantCity.text,
                              restaurantAddress: restaurantState.text,
                              phoneno: phoneno.text,
                              context: context)) {
                            try {
                              var generator = RandomStringGenerator(
                                  fixedLength: 8,
                                  hasSymbols: false,
                                  hasDigits: true,
                                  mustHaveAtLeastOneOfEach: true);
                              String staffKey = generator.generate();
                              viewModel.setStaffKey(staffKey);
                              Restaurant restaurant = Restaurant(
                                  name: restaurantName.text,
                                  isRestaurant: !Provider.of<RestaurantData>(
                                          context,
                                          listen: false)
                                      .isClub,
                                  staffKey: staffKey,
                                  city: restaurantCity.text,
                                  state: restaurantState.text,
                                  phone: phoneno.text);
                              viewModel.addRestaurant(restaurant, context);
                            } catch (e) {
                              log(e.toString());
                            }
                            context.go('/register/setup/logo');
                          }
                        },
                        child: PrimaryButton(text: "Finish Setup"),
                      )
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 43.h,
            )
          ],
        ),
      ),
    );
  }
}
