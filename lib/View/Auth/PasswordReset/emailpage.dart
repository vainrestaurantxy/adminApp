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

class EmailPage extends StatelessWidget {
  EmailPage({super.key});
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<AuthViewModel>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                header(text: "FORGOT PASSWORD?"),
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
                          GestureDetector(
                              onTap: () {
                                if (viewModel.validateEmail(
                                    email.text, context)) {
                                  viewModel.sendrestLink(email.text);
                                  context.go('/login');
                                }
                              },
                              child: PrimaryButton(
                                text: "Send Me Password Link",
                              ))
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
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
