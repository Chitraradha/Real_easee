import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/textfeild.dart';
import 'package:real__ease/View/post/sell/sellpost3.dart';
import 'package:real__ease/controller/sellprovider.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

class CreateSellPost2 extends StatelessWidget { 
  final String? sellvalue;
  final _formKey = GlobalKey<FormState>(); // Initialize a global key for form state

  CreateSellPost2({super.key, this.sellvalue});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Consumer<PostProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              appbar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: RealColor.textcolor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 10, top: 30),
                        child: Form(
                          key: _formKey, // Assign the global key to the Form widget
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "I am looking to sell a property",
                                style: posttext1,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  children: [
                                    SizedBox(height: 30),
                                    postTextform("Price Range", value.priceController,
                                      (input) {
                                        if (input == null || input.isEmpty) {
                                          return 'Please enter the price';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    postTextform("Bedrooms", value.bedroomcontroller,
                                      (input) {
                                        if (input == null || input.isEmpty) {
                                          return 'Please enter the number of bedrooms';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    postTextform("Bathrooms", value.bathroomcontroller,
                                      (input) {
                                        if (input == null || input.isEmpty) {
                                          return 'Please enter the number of bathrooms';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    postTextform("Car Spaces", value.carcontroller,
                                      (input) {
                                        if (input == null || input.isEmpty) {
                                          return 'Please enter the number of car spaces';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    postTextform("Number of People", value.peoplecontroller,
                                      (input) {
                                        if (input == null || input.isEmpty) {
                                          return 'Please enter the number of people';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    postTextform("Land Size (m)", value.landcontroller,
                                      (input) {
                                        if (input == null || input.isEmpty) {
                                          return 'Please enter your land size';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    postTextform("Selling Location", value.sellocationcontroller,
                                      (input) {
                                        if (input == null || input.isEmpty) {
                                          return 'Please enter your location';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      style: formtextstyle,
                                      controller: value.premanentaddcontroller,
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                        hintText: "Permanent Address",
                                        fillColor: RealColor.bgcolor,
                                        filled: true,
                                        hintStyle: formtexthit,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: RealColor.textcolor,
                                            width: 3,
                                          ),
                                          borderRadius: BorderRadius.circular(40),
                                        ),
                                      ),
                                      validator: (input) {
                                        if (input == null || input.isEmpty) {
                                          return 'Please enter your permanent address';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 50),
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
                                            if (_formKey.currentState?.validate() ?? false) {
                                              // If the form is valid, proceed to the next page
                                              print(sellvalue);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => CreateSellPost3()),
                                              );
                                            } else {
                                              // Optionally show a message or a snackbar for invalid input
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('Please fill in all fields correctly.')),
                                              );
                                            }
                                          },
                                          child: Text("Next", style: buttonfont),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("Back to Edit", style: buttoncolor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
