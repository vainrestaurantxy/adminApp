import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:admin_app/Data/Providers/imageUpload.dart';
import 'package:admin_app/Data/Repositories/FirebaseConnection.dart';
import 'package:admin_app/Model/RestaurantMenu/restaurantMenu.dart';
import 'package:admin_app/ViewModel/HomeViewModel/AddPageViewModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

import '../Providers/restaurantProvider.dart';

abstract class IDatabaseService {
  Future<Map<String, dynamic>?> get(String collection, String id);
  Future<void> add(String collection, Map<String, dynamic> data);
  Future<void> set(
      {required String collection,
      required String docId,
      required Map<String, dynamic> data,
      bool merge = false});
  Future<String?> uploadImage(
      {required XFile image,
      required String id,
      required BuildContext context,
      String where = "logo"});
  setSubcollection(String collection, String subCollection, String docid,
      Map<String, dynamic> data, bool merge);
  getSubcollection(String collection, String subCollection, String docid);
  setStatus(String status);
  getStatus();
}

@Injectable(as: IDatabaseService)
class DatabaseService implements IDatabaseService {
  DatabaseService(this.store, this.imageStore, this._auth);
  FirebaseFirestore store;
  IFirebaseService _auth;
  FirebaseStorage imageStore;

  String? userId;

  setStatus(String status) async {
    await store
        .collection("Status")
        .doc(_auth.getUserId)
        .set({"status": status});
  }

  Future<String> getStatus() async {
    DocumentSnapshot<Map<String, dynamic>> statusJson =
        await store.collection("Status").doc(_auth.getUserId).get();
    return statusJson.data()?["status"] ?? "NotLoggedIn";
  }

  @override
  Future<Map<String, dynamic>?> get(String collection, String id) async {
    log("Getting Data from Collection : ${collection} \n DocId: ${id}");
    // set();
    Map<String, dynamic>? data;
    try {
      DocumentSnapshot snap = await store.collection(collection).doc(id).get();
      data = snap.data() as Map<String, dynamic>?;
    } catch (e) {
      log(e.toString());
    }
    if (data == null) {
      log("Null Value in Response");
      return {};
    }
    return data;
  }

  @override
  Future<void> add(String collection, Map<String, dynamic> data) async {
    await store.collection(collection).add(data);
  }

  @override
  Future<void> set(
      {required String collection,
      required String docId,
      required Map<String, dynamic> data,
      bool merge = false}) async {
    await store
        .collection(collection)
        .doc(docId)
        .set(data, SetOptions(merge: merge));
  }

  @override
  Future<String?> uploadImage(
      {required XFile image,
      required String id,
      required BuildContext context,
      String where = "logo"}) async {
    final Reference storageReference = imageStore.ref().child('images/$id.jpg');
    Uint8List bytes = await image.readAsBytes();
    final UploadTask uploadTask = storageReference.putData(
        bytes, SettableMetadata(contentType: 'image/png'));
    final imagedata = Provider.of<ImageUpload>(context, listen: false);
    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      imagedata.setUploadByte(snapshot.bytesTransferred, snapshot.totalBytes);
      log(snapshot.bytesTransferred.toString());
    });
    await uploadTask.whenComplete(() async {
      final String downloadURL = await storageReference.getDownloadURL();
      imagedata.setDownloadLink(downloadURL);

      if (where == "logo") {
        setLogo(downloadURL, context);
      } else {
        setDish(downloadURL);
      }
    });
  }

  setLogo(String downloadURL, context) async {
    final ref = Provider.of<RestaurantData>(context, listen: false);
    ref.restaurant = ref.restaurant!.copyWith(logo: downloadURL);

    ref.notifyListeners();
    await set(
        collection: "Restaurants",
        docId: _auth.getUserId!,
        data: {"logo": downloadURL},
        merge: true);
  }

  setDish(String downloadUrl) async {
    GetIt.instance<AddViewModel>().setImage(downloadUrl);
  }

  setSubcollection(String collection, String subCollection, String docid,
      Map<String, dynamic> data, bool merge) async {
    await store
        .collection(collection)
        .doc(_auth.getUserId)
        .collection(subCollection)
        .doc(docid)
        .set(data, SetOptions(merge: merge));
  }

  Future<Map<String, dynamic>?> getSubcollection(
      String collection, String subCollection, String docid) async {
    DocumentSnapshot<Map<String, dynamic>> data = await store
        .collection(collection)
        .doc(_auth.getUserId)
        .collection(subCollection)
        .doc(docid)
        .get();
    // log('data in getSubcollection ${data.data()}');
    return data.data();
  }

  addSubcollection(String collection, String subCollection, String docid,
      Map<String, dynamic> data, bool merge) async {
    await store
        .collection(collection)
        .doc(_auth.getUserId)
        .collection(subCollection)
        .add(data);
  }
}
