import 'dart:js_interop';

import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Data/Repositories/DatabaseConnection.dart';
import 'package:admin_app/Data/Repositories/FirebaseConnection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@lazySingleton
class AuthViewModel {
  AuthViewModel(this._firebaseService, this._db);
  IFirebaseService _firebaseService;
  IDatabaseService _db;

  Future<void> register(String emailId, String password) async {
    await _firebaseService.signUp(emailId, password);
    await _db.setStatus("Registered");
  }

  sendrestLink(String email) {
    _firebaseService.resetPassword(email);
  }

  resetPassword(String code, String password) async {
    await _firebaseService.resetPassword_2(code, password);
  }

  logout() async {
    await _firebaseService.logout();
  }

  validateRegister(
      {required String emailId,
      required String password,
      required String rePassword,
      required BuildContext context}) {
    ErrorProvider validator =
        Provider.of<ErrorProvider>(context, listen: false);
    validator.validateRegisterEmail(emailId);
    validator.validateRegisterpassword(password);
    validator.validateRegisterRepassword(
        password: password, rePassword: rePassword);
    if (validator.registerEmail == null &&
        validator.registerReKey == null &&
        validator.registerkey == null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> login(String emailid, String password) async {
    try {
      await _firebaseService.signin(emailid, password);
      return 'admin';
    } catch (e) {
      // if (e == 'wrong-password') {
      //   String staffKey = await getStaffKey(emailid);
      //   if (password == staffKey) {
      //     return 'staff';
      //   }
      // }
    }
  }

  Future<String> getStaffKey(String email) async {
    final String staffKey;
    final snapshot = await FirebaseFirestore.instance
        .collection("StaffLogin")
        .doc(email)
        .get();

    if (snapshot.exists) {
      final Map<String, dynamic>? key = snapshot.data();
      staffKey = key!['staffkey'] as String;
      return staffKey;
    }
    return "";
  }

  bool isLoggedIn() {
    return _firebaseService.getUserId != null;
  }

  validateEmail(String email, context) {
    ErrorProvider validator =
        Provider.of<ErrorProvider>(context, listen: false);
    validator.validateRegisterEmail(email);
    if (validator.registerEmail == null) {
      return true;
    } else {
      return false;
    }
  }

  validateLogin(
      {required String email,
      required String password,
      required BuildContext context}) {
    ErrorProvider validator =
        Provider.of<ErrorProvider>(context, listen: false);
    validator.validateRegisterEmail(email);
    validator.validateRegisterpassword(password);
    if (validator.registerEmail == null && validator.registerkey == null) {
      return true;
    } else {
      return false;
    }
  }
}
