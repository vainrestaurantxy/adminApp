import 'dart:developer';

import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Model/Restaurant/restaurant.dart';
import 'package:admin_app/View/Auth/widgets.dart';
import 'package:admin_app/ViewModel/AuthViewModel/SetupViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    final data = Provider.of<RestaurantData>(context,listen: false);
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
                        errorText: ref.restaurantState,
                        hintText: "Enter State",
                        controller: restaurantState,
                        label: Text(
                            "${data.isClub ? "Club" : "Restaurant"} State"),
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
                              restaurantState: restaurantState.text,
                              phoneno: phoneno.text,
                              context: context)) {
                            try {
                              Restaurant restaurant = Restaurant(
                                  name: restaurantName.text,
                                  city: restaurantCity.text,
                                  state: restaurantState.text,
                                  phone: phoneno.text);
                              viewModel.addRestaurant(restaurant);
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
            )
          ],
        ),
      ),
    );
  }
}
