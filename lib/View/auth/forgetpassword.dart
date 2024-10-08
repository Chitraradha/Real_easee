import 'package:flutter/material.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/service/authservice.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final auth=FirebaseAuthenticationService();
  final TextEditingController emailController = TextEditingController();
  String emailError = '';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: RealColor.bgcolor,
        foregroundColor: RealColor.textcolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: RealColor.bgcolor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forgot Password",
                style: TextStyle(color: RealColor.textcolor, fontSize: 25),
              ),
              const SizedBox(height: 10),
              Text(
                "Enter the email address associated with your account and we'll send an email to reset your password.",
                style: TextStyle(color: RealColor.textcolor),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                style: TextStyle(color: RealColor.textcolor),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: RealColor.textcolor),
                  border: OutlineInputBorder(),
                  errorText: emailError.isNotEmpty ? emailError : null,
                ),
              ),
              const SizedBox(height: 170),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: screenWidth * 10,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: () {
                      // Validate email
                      String email = emailController.text.trim();
                      setState(() {
                        emailError = ''; // Reset the error message
                      });

                      // Email validation
                      if (email.isEmpty) {
                        setState(() {
                          emailError = 'Please enter your email address';
                        });
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
                        setState(() {
                          emailError = 'Please enter a valid email address';
                        });
                      } else {
                        // If valid, navigate to email verification page
                        auth.sendPasswordReset(emailController.text);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An email for password reset has been sent to your email")));
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
