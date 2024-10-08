import 'package:flutter/material.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';
import 'package:real__ease/core/service/authservice.dart';

class ResetProfilePassword extends StatelessWidget {
  const ResetProfilePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final auth=FirebaseAuthenticationService();
  final TextEditingController emailController = TextEditingController();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          profilebar("Reset Password"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 650,
                decoration: BoxDecoration(
                  color: RealColor.textcolor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 450,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              hintText: "Enter your email",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: profiletext,
                          ),
                        ),
                      ),
                      SizedBox(height: 300),
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: screenWidth * 0.9,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: RealColor.buttncolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            onPressed: () {
                              auth.sendPasswordReset(emailController.text);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An email for password reset has been sent to your email")));
                              Navigator.pop(context);
                            },
                            child: Text("Send", style: buttonfont),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
