import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:admin_app/Constants/Widgets/SecondaryButton.dart';
import 'package:admin_app/Data/Providers/restaurantProvider.dart';
import 'package:admin_app/View/Auth/widgets.dart';
import 'package:admin_app/ViewModel/AuthViewModel/AuthViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<AuthViewModel>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Choose your profile",
                    style: AppTypography.smallText.copyWith(
                      fontFamily: 'Bebas Neue',
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        context.go("/login");
                      },
                      child: createButton(
                          image: 'assets/Restaurant icon.png',
                          heading: "Restaurant",
                          subtitle: "I am a restaurant owner, admin or staff",
                          color: AppColor.purpleColor)),
                  SizedBox(
                    height: 16.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        final ref =
                            Provider.of<RestaurantData>(context, listen: false);
                        ref.isClub = true;
                        // if (viewModel.isLoggedIn()) {
                        //   context.go('/home');
                        // } else {
                        context.go("/login");
                        // }
                      },
                      child: createButton(
                          image: 'assets/club icon.png',
                          heading: "Club",
                          subtitle: "I am a club/pub owner, admin or staff",
                          color: AppColor.darkPink)),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 21.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 169.w,
                          height: 2,
                          decoration: const BoxDecoration(color: AppColor.grey),
                        ),
                        SizedBox(width: 1.w),
                        SizedBox(
                          width: 48.w,
                          child: Text(
                            'New?',
                            textAlign: TextAlign.center,
                            style: AppTypography.smallText
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(width: 1.w),
                        Container(
                          width: 169.w,
                          height: 2,
                          decoration: const BoxDecoration(color: AppColor.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SecondaryButton(text: "Visit Our Website"),
                  SizedBox(
                    height: 43.h,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
