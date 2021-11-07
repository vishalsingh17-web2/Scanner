import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scanner/create_qr.dart';
import 'package:scanner/qrpage.dart';
import 'package:scanner/welcome.dart';

import '../../homepage.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

 //SIGN UP METHOD
  Future<void> signUp({required String email, required String password, required BuildContext context}) async {
    try {
      var newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await newUser.user!.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email sent')));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }
  // Forgot Password
  Future<void> forgotPassword({required String email, required BuildContext context}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email sent')));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }


  //SIGN IN METHOD
  Future<void> signIn({required String email, required String password, required BuildContext context}) async {
    try {
      var user  = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(user.user!.emailVerified){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(pages: [const CreateQR(),QRViewExample()],)));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email not verified')));
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();
  }
}