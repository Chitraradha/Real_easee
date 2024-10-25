import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/textfeild.dart';
import 'package:real__ease/View/post/sell/sellpost2.dart';
import 'package:real__ease/controller/sellprovider.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

class CreateSellPost extends StatelessWidget {
  CreateSellPost({super.key, required String id, required String todo});

  final _formKey = GlobalKey<FormState>(); // GlobalKey for form validation

  @override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Scaffold(
    body: Consumer<PostProvider>(
      builder: (context, value, child) {
        return SingleChildScrollView( // Ensure the entire Column is scrollable
          child: Column(
            children: [
              appbar(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: RealColor.textcolor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("I am looking to sell a property", style: posttext1),
                          const SizedBox(height: 30),
                          postTextform("Name", value.pnamecontroller, (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          }),
                          const SizedBox(height: 20),
                          postTextform("Email", value.emailcontroller, (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(input)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          }),
                          const SizedBox(height: 20),
                          postTextform("Phone", value.phonecontroller, (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your phone number';
                            } else if (!RegExp(r'^[0-9]+$').hasMatch(input)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          }),
                          const SizedBox(height: 20),
                          TextFormField(
                            style: formtextstyle,
                            controller: value.addresscontroller,
                            maxLines: 6,
                            decoration: InputDecoration(
                              hintText: "Address",
                              fillColor: RealColor.bgcolor,
                              filled: true,
                              hintStyle: formtexthit,
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: RealColor.textcolor, width: 3),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            validator: (input) {
                              if (input == null || input.isEmpty) {
                                return 'Please enter an address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          postTextform("City", value.citycontroller, (input) {
                            if (input == null || input.isEmpty) {
                              return 'Please enter your city';
                            }
                            return null;
                          }),
                          const SizedBox(height: 50),
                          Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              width: screenWidth * 0.8,
                              height: 60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: RealColor.buttncolor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CreateSellPost2()),
                                    );
                                  }
                                },
                                child: Text("Next", style: buttonfont),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Back", style: buttoncolor),
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
      },
    ),
  );
}
}