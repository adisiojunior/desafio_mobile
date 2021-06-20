import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import '../error_handler.dart';
import '../home_page.dart';
import '../login_page.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated  }
class AuthService  with ChangeNotifier {
  
  Status _status = Status.Uninitialized;
  FirebaseAuth _user;

  
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

 Status get status => _status;

 //Sair
 Future singOut() async {
   FirebaseAuth.instance.signOut();
   _status = Status.Unauthenticated;
   notifyListeners();
   return Future.delayed(Duration.zero);
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

//fb signin

  fbSignIn() async {
    final fb = FacebookLogin();

// Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

// Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
        // Logged in

        // Send access token to server for validation and auth
        final FacebookAccessToken accessToken = res.accessToken;
        final AuthCredential authCredential =
            FacebookAuthProvider.credential(accessToken.token);
        final result =
            await FirebaseAuth.instance.signInWithCredential(authCredential);

        // Get profile data
        final profile = await fb.getUserProfile();
        print('Hello, ${profile.name}! You ID: ${profile.userId}');

        // Get user profile image url
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');

        // Get email (since we request email permission)
        final email = await fb.getUserEmail();
        // But user can decline permission
        if (email != null) print('And your email is $email');

        break;
      case FacebookLoginStatus.cancel:
        // User cancel log in
        break;
      case FacebookLoginStatus.error:
        // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }
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

  Future<void> onAuthStateChanged(FirebaseAuth firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;

    } else {
      _status = Status.Authenticated;
    }

    notifyListeners();
  }
}