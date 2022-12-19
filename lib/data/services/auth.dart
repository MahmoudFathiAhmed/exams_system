import 'package:exams_system/data/models/exam_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  ExamUser? _getUser(User user) {
    return ExamUser(uid: user.uid);
  }

  Future sigInEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user!;
      return _getUser(user);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future signUpEmailAndPassowrd(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user!;
      return _getUser(user);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future forgotPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      debugPrint('$e');
      return null;
    }
  }
}
