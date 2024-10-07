import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real__ease/View/Widget/textfeild.dart';
import 'package:real__ease/View/auth/login.dart';
import 'package:real__ease/View/home/navi.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';
import 'package:real__ease/core/service/authservice.dart';


class SignUppage extends StatefulWidget {
  const SignUppage({super.key});

  @override
  State<SignUppage> createState() => _SignUppageState();
}

class _SignUppageState extends State<SignUppage> {
  FirebaseAuthenticationService authService =FirebaseAuthenticationService();

 void UserSignup() async {
  String email = emailcontroller.text;
  String password = passwordcontroller.text;
  String name = namecontroller.text;
  String phone = phonenumcontroller.text;

  // Assume you have a File object for the selected image
  File? image; // Make sure to initialize this with the picked image file

  User? user = await authService.signupWithEmailAndPassword(email, password);

  if (user != null) {
    String currentUid = user.uid; // Get the current user's UID

    // Prepare user profile data
    Map<String, dynamic> userProfile = {
      "name": name,
      "phone": phone,
      "email": email,
      "id": currentUid,
      "profileImage": null // Initialize with null; will update after uploading image
    };

    // Set the document using the UID as the document ID
    await FirebaseFirestore.instance.collection("PROFILE").doc(currentUid).set(userProfile);

    // If an image is selected, upload it to Firebase Storage
    if (image != null) {
      String filePath = 'profile_images/${currentUid}.jpg'; // Path for the image

      // Upload the image to Firebase Storage
      UploadTask uploadTask = FirebaseStorage.instance.ref().child(filePath).putFile(image);
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Update the user's profile document with the image URL
      await FirebaseFirestore.instance.collection("PROFILE").doc(currentUid).update({
        "profileImage": downloadUrl,
      });
    }

    // Show success Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Real Ease Welcomes You", style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 13, 13, 13),
      ),
    );

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigatorMAain()));
  } else {
    // Show error Snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Some error occurred!", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
    );
  }
}


  
  TextEditingController namecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
    TextEditingController phonenumcontroller=TextEditingController();

  bool _isObsured = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxwidth = MediaQuery.of(context).size.width * 0.2;
    return Scaffold(
      backgroundColor: RealColor.bgcolor,
      appBar: AppBar(
        title: Center(
            child: Text(
          "Sign Up",
          style: loginfont1,
        )),
        backgroundColor: RealColor.bgcolor,
        foregroundColor: RealColor.textcolor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                loginTextform("Name", namecontroller),
                const SizedBox(
                  height: 30,
                ),
               loginTextform("Email", emailcontroller),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style: formtextstyle,
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObsured = !_isObsured;
                            });
                          },
                          icon: _isObsured
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.remove_red_eye_outlined)),
                      labelText: "Password",
                      labelStyle:formtexthit,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: RealColor.textcolor,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(40))),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style: formtextstyle,
                  controller: phonenumcontroller,
                  decoration: InputDecoration(
                      labelText: "Phone",
                      labelStyle:formtexthit,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: RealColor.textcolor,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(40))),
                ),
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      width: screenWidth * 10,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: RealColor.buttncolor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35))),
                          onPressed: () {
                            UserSignup();
                          },
                          child:  Text(
                            "Sign Up",
                            style: buttonfont
                          ))),
                ),
                const SizedBox(height: 70),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: RealColor.hitcolor,
                        thickness: 3,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "or continue with",
                      style: formtextstyle
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Divider(
                        color: RealColor.hitcolor,
                        thickness: 3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: boxwidth,
                      height: 80,
                      decoration: BoxDecoration(
                          color: RealColor.buttncolor,
                          borderRadius: BorderRadius.circular(5)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.google,
                            color: Colors.black,
                            size: 40,
                          )),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: boxwidth,
                      height: 80,
                      decoration: BoxDecoration(
                          color: RealColor.buttncolor,
                          borderRadius: BorderRadius.circular(5)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.black,
                            size: 40,
                          )),
                    ),
                  ],
                ),
                 SizedBox(height:MediaQuery.of(context).size.height*0.1,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ?",style: formtextstyle,),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                    }, child: Text("Sign in",style: GoogleFonts.inknutAntiqua(color: RealColor.buttncolor)),)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
 
}
