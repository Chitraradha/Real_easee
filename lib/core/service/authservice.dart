import 'package:firebase_auth/firebase_auth.dart';

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
}
