import 'package:flutter/material.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/textfeild.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

class ResetProfilePassword extends StatelessWidget {
  const ResetProfilePassword({super.key});

  @override
  Widget build(BuildContext context) {
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
                        child: Container(
                          width: 450,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                ),
                                child: Text("Old Password", style: profiletext),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ResetPassTextform("New Password"),
                      SizedBox(
                        height: 20,
                      ),
                      ResetPassTextform("Confirm Password"),
                      SizedBox(
                        height: 350,
                      ),
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
                            onPressed: () {},
                            child: Text("Update", style: buttonfont),
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
