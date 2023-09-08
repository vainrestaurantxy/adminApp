
import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Data/Repositories/FirebaseConnection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@lazySingleton
class AuthViewModel {
  AuthViewModel(this._firebaseService);
  IFirebaseService _firebaseService;

  Future<void> register(String emailId, String password) async {
    _firebaseService.signUp(emailId, password);
  }

  sendrestLink(String email){
    _firebaseService.resetPassword(email);
  }

  resetPassword(String code,String password)async{
await _firebaseService.resetPassword_2(code,password);
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

  Future<void> login(String emailid, String password) async {
    await _firebaseService.signin(emailid, password);
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
