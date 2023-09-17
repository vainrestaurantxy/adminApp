import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/SecondaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Data/Providers/restaurantProvider.dart';
import 'package:admin_app/ViewModel/AuthViewModel/SetupViewModel.dart';
import 'package:admin_app/ViewModel/HomeViewModel/homeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../Constants/Colors/colors.dart';
import '../../../Constants/Typography/typography.dart';
import '../widgets.dart';

class LogoPage extends StatelessWidget {
  LogoPage({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<SetupViewModel>();
    final data = Provider.of<RestaurantData>(context, listen: false);
    final homeModel = GetIt.instance<HomeViewModel>();
    homeModel.getRestaurant(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(text: "Add Logo".toUpperCase()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  Text(
                    "Upload a transparent ${data.isClub ? "club" : "restaurant"} Logo",
                    style: AppTypography.smallText,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                      onTap: () async {
                        XFile? file = await viewModel.getImagefromDevice();
                        if (file != null) {
                          viewModel.upload(context);
                          context.go('/register/setup/logo/upload');
                        }
                      },
                      child: SecondaryButton(text: "Upload Image")),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // SizedBox(
                  //   width: 396.w,
                  //   height: 21.h,
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         width: 173.w,
                  //         height: 2,
                  //         decoration: const BoxDecoration(color: AppColor.grey),
                  //       ),
                  //       const SizedBox(width: 1),
                  //       SizedBox(
                  //         width: 48.w,
                  //         child: Text(
                  //           'or',
                  //           textAlign: TextAlign.center,
                  //           style: AppTypography.smallText
                  //               .copyWith(fontWeight: FontWeight.w600),
                  //         ),
                  //       ),
                  //       const SizedBox(width: 1),
                  //       Container(
                  //         width: 173.w,
                  //         height: 2,
                  //         decoration: const BoxDecoration(color: AppColor.grey),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // CustomTextField(
                  //   controller: controller,
                  //   hintText: "Extract Image from URL",
                  // ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.text.isNotEmpty) {
                        viewModel.setlogo(controller.text);
                      }
                      context.go('/register/setup/logo/upload/preview');
                    },
                    child: PrimaryButton(
                      text: "Proceed",
                      // disabled: true,
                    ),
                  ),

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
