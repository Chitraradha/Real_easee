import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/textfeild.dart';
import 'package:real__ease/View/post/rent/rentpost2.dart';
import 'package:real__ease/controller/rentprovider.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

class CreateRentPost1 extends StatelessWidget {
  const CreateRentPost1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final _formKey = GlobalKey<FormState>(); // Initialize a global key for form state

    return Scaffold(
      body: Consumer<RentProvider>(
        builder: (context, rent, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                appbar(),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    width: double.infinity,
                    height: 850,
                    decoration: BoxDecoration(
                        color: RealColor.textcolor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 10, top: 30),
                      child: Form(
                        key: _formKey, // Assign the global key to the Form widget
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "I am looking to Rent a property",
                              style: posttext1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  SizedBox(height: 30),
                                  postTextform("Name", rent.pnamecontroller, (input) {
                                    if (input == null || input.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  }),
                                  SizedBox(height: 20),
                                  postTextform("Email", rent.emailcontroller, (input) {
                                    if (input == null || input.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  }),
                                  SizedBox(height: 20),
                                  postTextform("Phone", rent.phonecontroller, (input) {
                                    if (input == null || input.isEmpty) {
                                      return 'Please enter your phone number';
                                    }
                                    return null;
                                  }),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    style: formtextstyle,
                                    controller: rent.addresscontroller,
                                    maxLines: 6,
                                    decoration: InputDecoration(
                                      hintText: "Address",
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
                                        return 'Please enter your address';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  postTextform("City", rent.citycontroller, (input) {
                                    if (input == null || input.isEmpty) {
                                      return 'Please enter your city';
                                    }
                                    return null;
                                  }),
                                ],
                              ),
                            ),
                            SizedBox(height: 50),
                            Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                width: screenWidth * 0.8, // Adjust the button width
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: RealColor.buttncolor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(35)),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ?? false) {
                                      // If the form is valid, proceed to the next page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CreateRentPost2()),
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
