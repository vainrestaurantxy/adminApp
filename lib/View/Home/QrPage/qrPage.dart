import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:html' as html;
import 'package:admin_app/Constants/Colors/colors.dart';
import 'package:admin_app/Constants/Typography/typography.dart';
import 'package:admin_app/Constants/Widgets/PrimaryButton.dart';
import 'package:admin_app/Constants/Widgets/TextField.dart';
import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Data/Providers/homeProvider.dart';
import 'package:admin_app/View/Home/QrPage/QRwidget.dart';
import 'package:admin_app/ViewModel/HomeViewModel/homeViewModel.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:qr_bar_code/qr/src/qr_code.dart';
import 'package:qr_bar_code/qr_bar_code.dart';
import 'package:screenshot/screenshot.dart';
import 'package:web_toast/web_toast.dart';

import '../../../Data/Providers/restaurantProvider.dart';
import '../../../ViewModel/HomeViewModel/AddPageViewModel.dart';

class QRPage extends StatelessWidget {
  QRPage({super.key});
  List<GlobalKey> _key = [];

  TextEditingController tables = TextEditingController(text: "0");
  ScreenshotController screenshotController = ScreenshotController();
  void saveUint8ListToFile(Uint8List uint8list, String fileName) {
    // Create a blob from the Uint8List and specify the MIME type
    final blob = Blob([uint8list], 'image/jpeg');

    // Create an object URL from the blob
    final url = Url.createObjectUrlFromBlob(blob);

    // Create a temporary anchor element
    final anchor = AnchorElement(href: url)
      ..target = 'web'
      ..download = fileName; // Specify the file name

    // Trigger a click event on the anchor element to initiate the download
    anchor.click();

    // Release the object URL
    Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    final vm = GetIt.instance<AddViewModel>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<RestaurantData>(builder: (context, ref, _) {
        tables.text = (ref.restaurant?.noTable ?? "10").toString();
        return Column(
          children: [
            Container(
              width: 396.w,
              height: 72.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'QR',
                    style: AppTypography.largeText
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 396.w,
                    child: Text(
                      'QR codes have been generated for tables at your restaurant.',
                      style: AppTypography.smallText
                          .copyWith(color: AppColor.blackText),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextField(
              onChanged: (v) {
                final ref = Provider.of<ErrorProvider>(context, listen: false);
                if (ref.validateNumberOnly(v) == null) {
                  Provider.of<HomeProvider>(context, listen: false)
                      .notifyListeners();
                }
              },
              controller: tables,
              keyboardType: TextInputType.number,
              label: Text("Number of Tables"),
              maxLength: 3,
              hintText: "Enter Tables",
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () async {
                final vm = GetIt.instance<HomeViewModel>();
                await vm.setTables(context, int.parse(tables.text));
                Toast.success(text: "No. of Tables Saved!");
              },
              child: PrimaryButton(
                text: "Save",
              ),
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () async {
                final ref = Provider.of<ErrorProvider>(context, listen: false);
                if (tables.text.isNotEmpty &&
                    ref.validateNumberOnly(tables.text) == null)
                  for (int index = 0; index < int.parse(tables.text); index++) {
                    Uint8List? image =
                        await screenshotController.captureFromLongWidget(
                      QR(index: index, id: vm.getuserID),
                    );
                    saveUint8ListToFile(image, "Qr${index}.png");
                  }
              },
              child: PrimaryButton(
                text: "Download all QRs",
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Consumer<HomeProvider>(
                  builder: (_, ref, __) {
                    return Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                          child: tables.text.isEmpty
                              ? const SizedBox()
                              : Wrap(
                                  spacing: 16,
                                  direction: Axis.horizontal,
                                  children: List.generate(
                                      int.parse(tables.text), (index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                            onTap: () async {
                                              // _capturePng(index);
                                              Uint8List? image =
                                                  await screenshotController
                                                      .captureFromLongWidget(
                                                QR(
                                                    index: index,
                                                    id: vm.getuserID),
                                              );
                                              saveUint8ListToFile(
                                                  image, "Qr${index}.png");
                                              // if (path == null) {
                                              //   return;
                                              // }
                                              // final file = await File(path).create();
                                              // file.writeAsBytesSync(image);
                                            },
                                            child: Stack(
                                              children: [
                                                QR(
                                                    index: index,
                                                    id: vm.getuserID),
                                                Positioned(
                                                    right: 16,
                                                    bottom: 16,
                                                    child: Container(
                                                      height: 25.w,
                                                      width: 25.h,
                                                      decoration: BoxDecoration(
                                                          color: AppColor
                                                              .purpleColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      1000)),
                                                      child: SvgPicture.asset(
                                                          'assets/download.svg'),
                                                    ))
                                              ],
                                            )),
                                        Text(
                                          'QR Table #${index + 1}',
                                          style: AppTypography.smallText
                                              .copyWith(
                                                  color: AppColor.blackText),
                                        )
                                      ],
                                    );
                                  })),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
