import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:real__ease/View/home/navi.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signupWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print("The email already in use");
      } else {
        print("An error occured: ${e.code}");
      }
    }
  }

    Future<User?> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print("The email already in use");
      } else {
        print("An error occured: ${e.code}");
      }
    }
  }
   Future<void>sendPasswordReset(String email)async{
    try{
      await auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());
    }
  }

Future<UserCredential?> loginWithGoogle(context) async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      print("User canceled the Google sign-in.");
      return null;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final OAuthCredential cred = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

     await auth.signInWithCredential(cred);
     Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigatorMAain()));
  
  } catch (e) {
    print("An error occurred during Google sign-in: ${e.toString()}");
    return null;
  }
}

}


