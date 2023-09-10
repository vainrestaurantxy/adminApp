import 'dart:math';

import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/SecondaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Data/Providers/restaurantProvider.dart';
import 'package:admin_app/ViewModel/AuthViewModel/SetupViewModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../../../Constants/Colors/colors.dart';
import '../../../Constants/Typography/typography.dart';
import '../widgets.dart';

class LogoPreview extends StatelessWidget {
  LogoPreview({super.key});
  PaletteGenerator? pallete;
  List<PaletteColor> colors = [];
  Color gradientColor = Color(0xFFFFD79A);

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<SetupViewModel>();
    viewModel.getRestaurant(context);
    final ref = Provider.of<RestaurantData>(context, listen: false);
    viewModel.palette(ref);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(text: "logo preview".toUpperCase()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      Consumer<RestaurantData>(builder: (context, ref, _) {
                        return Column(
                          children: [
                            Container(
                              width: 290,
                              height: 175.82,
                              padding: const EdgeInsets.only(
                                top: 58.04,
                                left: 65.61,
                                right: 64.98,
                                bottom: 10.82,
                              ),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                border: Border.all(
                                    width: 5, color: AppColor.purpleColor),
                                gradient: LinearGradient(
                                  begin: Alignment(-0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    gradientColor,
                                    Colors.white.withOpacity(0)
                                  ],
                                ),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: double.infinity,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 31.54,
                                            height: 28.39,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(ref
                                                        .restaurant?.logo ??
                                                    "https://via.placeholder.com/32x28"),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 5.05),
                                          Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  ref.restaurant?.name ??
                                                      'TAJ HOTEL',
                                                  style: TextStyle(
                                                    color: Color(0xFF323232),
                                                    fontSize: 15.14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                const SizedBox(height: 2.52),
                                                SizedBox(
                                                  width: 139.42,
                                                  child: Text(
                                                    '${ref.restaurant?.city ?? "Mumbai"}, ${ref.restaurant?.city ?? "Maharashtra"}\nYour order will be ready in 00:01:23',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF323232),
                                                      fontSize: 8.20,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.76,
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
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: 396.w,
                              child: Text(
                                'Select theme',
                                style: AppTypography.smallText,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: viewModel.colors.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    gradientColor =
                                        viewModel.colors[index].color;
                                    ref.update();
                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 48,
                                        height: 48,
                                        decoration: ShapeDecoration(
                                          color: viewModel.colors[index].color,
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 0.50,
                                                color: Color(0xFF9997A1)),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                          onTap: () {
                            viewModel.setColor(gradientColor);
                            context.go('/home');
                          },
                          child: PrimaryButton(text: "Finish Setup"))
                    ],
                  ),
                ],
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
