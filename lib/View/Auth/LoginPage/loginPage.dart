import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/View/Auth/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../ViewModel/AuthViewModel/AuthViewModel.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<AuthViewModel>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(text: "LOGIN TO RESTAURANTXY"),
            SizedBox(
              height: 28.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Consumer<ErrorProvider>(
                builder: (_, ref, __) {
                  return Column(
                    children: [
                      CustomTextField(
                        controller: email,
                        errorText: ref.registerEmail,
                        hintText: "Enter Email Id",
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomTextField(
                        controller: password,
                        errorText: ref.registerkey,
                        hintText: "Enter Key",
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go('/login/email');
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Forgot Key?',
                            textAlign: TextAlign.right,
                            style: AppTypography.smallText
                                .copyWith(color: AppColor.blackText),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () async {
                          if (viewModel.validateLogin(
                              email: email.text,
                              password: password.text,
                              context: context)) {
                            await viewModel.login(email.text, password.text);
                            if (viewModel.isLoggedIn()) {
                              context.go('/home');
                            }
                          }
                        },
                        child: PrimaryButton(
                          text: "Login",
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: 396.w,
                        height: 21.h,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 173.w,
                              height: 2,
                              decoration: BoxDecoration(color: AppColor.grey),
                            ),
                            const SizedBox(width: 1),
                            SizedBox(
                              width: 48.w,
                              child: Text(
                                'or',
                                textAlign: TextAlign.center,
                                style: AppTypography.smallText
                                    .copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(width: 1),
                            Container(
                              width: 173.w,
                              height: 2,
                              decoration: BoxDecoration(color: AppColor.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.go("/register");
                        },
                        child: PrimaryButton(
                          text: "Create New Account",
                        ),
                      ),
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
