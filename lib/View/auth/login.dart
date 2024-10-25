import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real__ease/View/Widget/textfeild.dart';
import 'package:real__ease/View/auth/forgetpassword.dart';
import 'package:real__ease/View/auth/signup.dart';
import 'package:real__ease/View/home/navi.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';
import 'package:real__ease/core/service/authservice.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuthenticationService _auth = FirebaseAuthenticationService();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  void UserSignin() async {
    if (_formKey.currentState!.validate()) { // Validate the form
      String email = emailcontroller.text.trim();
      String password = passwordcontroller.text.trim();

      User? user = await _auth.signinWithEmailAndPassword(email, password);
      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Real Ease Welcomes You", style: TextStyle(color: Colors.white)),
            backgroundColor: Color.fromARGB(255, 11, 11, 11),
          ),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigatorMAain()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Check your email and password.", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool _isObsured = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final boxwidth = MediaQuery.of(context).size.width * 0.2;

    return Scaffold(
      backgroundColor: RealColor.bgcolor,
      appBar: AppBar(
        title: Center(child: Text("Sign in", style: loginfont1)),
        backgroundColor: RealColor.bgcolor,
        foregroundColor: RealColor.textcolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form( // Wrap the Column in a Form widget
              key: _formKey, // Assign the form key
              child: Column(
                children: [
                  loginTextform("Email", emailcontroller, validateEmail), // Add validation
                  const SizedBox(height: 30),
                  TextFormField(
                    style: formtextstyle,
                    controller: passwordcontroller,
                    obscureText: _isObsured,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObsured = !_isObsured;
                          });
                        },
                        icon: _isObsured
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.remove_red_eye_outlined),
                      ),
                      labelText: "Password",
                      labelStyle: formtexthit,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: RealColor.textcolor,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    validator: validatePassword, // Add password validation
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
                      },
                      child: Text("Forgot Password?", style: formtextstyle),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: screenWidth * 10,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: RealColor.buttncolor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                        ),
                        onPressed: UserSignin,
                        child: Text("Continue", style: buttonfont),
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: RealColor.hitcolor, thickness: 3),
                      ),
                      const SizedBox(width: 10),
                      Text("or continue with", style: formtextstyle),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Divider(color: RealColor.hitcolor, thickness: 3),
                      ),
                    ],
                  ),
                  const SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: boxwidth,
                        height: 80,
                        decoration: BoxDecoration(
                          color: RealColor.buttncolor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: IconButton(
                          onPressed: () {
                            _auth.loginWithGoogle(context);
                          },
                          icon: const Icon(FontAwesomeIcons.google, color: Colors.black, size: 40),
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?", style: formtextstyle),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUppage()));
                        },
                        child: Text("Sign up", style: GoogleFonts.inknutAntiqua(color: RealColor.buttncolor)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Validation functions
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
