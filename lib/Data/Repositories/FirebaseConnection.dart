import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class IFirebaseService {
  signUp(String emailId, String password);
  String? get getUserId;
  logout();
  signin(String emailId, String password);
  resetPassword(String email);
  resetPassword_2(String password, String code);
  String? get getEmailId;
}

@Injectable(as: IFirebaseService)
class FirebaseService implements IFirebaseService {
  FirebaseService(this._auth);
  FirebaseAuth _auth;

  String? userId;

  Future<void> logout() async {
    await _auth.signOut();
  }

  signUp(String emailId, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: emailId, password: password);
    if (_auth.currentUser?.uid == null) {
      return false;
    }
    userId = _auth.currentUser?.uid;
  }

  resetPassword_2(String password, String code) async {
    await _auth.confirmPasswordReset(code: code, newPassword: password);
  }

  resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  signin(String emailId, String password) async {
    await _auth.signInWithEmailAndPassword(email: emailId, password: password);
    if (_auth.currentUser?.uid == null) {
      return false;
    }
    userId = _auth.currentUser?.uid;
  }

  String? get getUserId => _auth.currentUser?.uid;
  String? get getEmailId => _auth.currentUser?.email;
}
