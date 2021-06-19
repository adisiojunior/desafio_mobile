import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../error_handler.dart';
import '../home_page.dart';
import '../login_page.dart';

class AuthService {

 // lindado com autenticação e registro
 handleAuth() {
   return StreamBuilder(
     stream: FirebaseAuth.instance.authStateChanges(),
     builder: (BuildContext context, snapshot) {
       if (snapshot.hasData) {
         return HomePage();
       } else 
         return LoginPage();
       
     }
   );
 }
 //Sair
 singOut() {
   FirebaseAuth.instance.signOut();
 }

 //Login
 singIn(String email, String password, context) {
   FirebaseAuth.instance
    .signInWithEmailAndPassword(email: email, password: password)
    .then((val) {
      print('Logado');

    }).catchError((e) {
      ErrorHandler().errorDialog(context, e);
    
    });
 }

 //Signup a new user
  signUp(String email, String password) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

   //Reset Password
  resetPasswordLink(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}