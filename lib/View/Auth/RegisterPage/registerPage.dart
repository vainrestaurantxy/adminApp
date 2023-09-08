import 'dart:developer';

import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Model/Restaurant/restaurant.dart';
import 'package:admin_app/View/Auth/widgets.dart';
import 'package:admin_app/ViewModel/AuthViewModel/AuthViewModel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../Data/Providers/restaurantProvider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController reEnterPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthViewModel viewModel = GetIt.instance<AuthViewModel>();
    final ref = Provider.of<RestaurantData>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(
                text: "CREATE ${ref.isClub ? "CLUB" : "RESTAURANT"} ACCOUNT"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Consumer<ErrorProvider>(
                builder: (_, ref, __) {
                  return Column(
                    children: [
                      SizedBox(height: 28.h),
                      CustomTextField(
                        controller: email,
                        errorText: ref.registerEmail,
                        hintText: "Enter Email ID",
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: password,
                        obscureText: true,
                        errorText: ref.registerkey,
                        hintText: "Create Admin Key(Password)",
                      ),
                      SizedBox(height: 8.h),
                      CustomTextField(
                        controller: reEnterPassword,
                        obscureText: true,
                        errorText: ref.registerReKey,
                        hintText: "Reenter Admin Key",
                      ),
                      SizedBox(height: 16.h),
                      GestureDetector(
                          onTap: () async {
                            if (viewModel.validateRegister(
                                emailId: email.text,
                                password: password.text,
                                rePassword: reEnterPassword.text,
                                context: context)) {
                              try {
                                await viewModel.register(
                                    email.text, password.text);
                              } catch (e) {
                                log(e.toString());
                              }
                              context.go('/register/setup');
                            }
                          },
                          child: PrimaryButton(text: "Create Account"))
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
