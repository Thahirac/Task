// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'home_page.dart';

class GoogleSignInController with ChangeNotifier{
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  login(BuildContext context) async{
    this.googleAccount = await _googleSignIn.signIn();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const Home()));
    notifyListeners();
  }

  logOut() async{
    this.googleAccount = await _googleSignIn.signOut();
    notifyListeners();
  }
}