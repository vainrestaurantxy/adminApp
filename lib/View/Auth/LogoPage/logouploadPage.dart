import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/ViewModel/AuthViewModel/SetupViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../Constants/Colors/colors.dart';
import '../../../Constants/Typography/typography.dart';
import '../../../Data/Providers/imageUpload.dart';
import '../widgets.dart';

class LogoUploadPage extends StatelessWidget {
  const LogoUploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.instance<SetupViewModel>();

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
                    "Uploading restaurant Logo",
                    style: AppTypography.smallText,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Consumer<ImageUpload>(builder: (context, ref, _) {
                    return Column(
                      children: [
                        LinearProgressIndicator(
                          backgroundColor: AppColor.grey,
                          color: AppColor.purpleColor,
                          value: ref.uploadedBytes /
                              (ref.uploadTotalBytes == 0
                                  ? 1
                                  : ref.uploadTotalBytes),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.go('/register/setup/logo/upload/preview');
                          },
                          child: PrimaryButton(
                            text: "Proceed",
                            disabled: ref.uploadedBytes != ref.uploadTotalBytes,
                          ),
                        )
                      ],
                    );
                  }),
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
