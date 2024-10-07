import 'package:flutter/material.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/textfeild.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController namecontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController emailcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          profilebar("Edit Profile"),
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
                      profileTextform("Chitra"),
                      SizedBox(height: 20,),
                      profileTextform("Email"),
                      SizedBox(height: 20,),
                      profileTextform("Phone"),                  
                      SizedBox(height: 350,),
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
                            },
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