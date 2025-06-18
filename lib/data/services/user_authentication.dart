import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAuthentication extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  UserAuthentication(this._firebaseAuth);

  User? _user;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  User? currentUser() => _user;
  bool initialLogin = false;

  void setInitialLogin(bool value) {
    initialLogin = value;
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      _user = _firebaseAuth.currentUser;
      initialLogin = true;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } finally {
      _user = _firebaseAuth.currentUser;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      _user = _firebaseAuth.currentUser;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } finally {
      _user = null;
      notifyListeners();
    }
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } finally {
      _user = _firebaseAuth.currentUser;
      notifyListeners();
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteUser() async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      try {
        await user.delete();
      } on FirebaseAuthException catch (e) {
        throw Exception(e.message);
      }
    } else {
      throw Exception('No user is currently signed in.');
    }
  }
}
