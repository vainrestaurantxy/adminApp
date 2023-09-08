import 'package:flutter/material.dart';

class ImageUpload extends ChangeNotifier {
  double uploadTotalBytes = 0.0;
  double uploadedBytes = 0.0;
  String downloadLink = "";

  setUploadByte(uploaded, total) {
    uploadedBytes = uploaded;
    uploadTotalBytes = total;
    notifyListeners();
  }

  setDownloadLink(String link) {
    downloadLink = link;
    notifyListeners();
  }
}
