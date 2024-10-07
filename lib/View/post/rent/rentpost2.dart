import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/textfeild.dart';
import 'package:real__ease/View/post/rent/rentpost3.dart';
import 'package:real__ease/controller/rentprovider.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

class CreateRentPost2 extends StatelessWidget {
  const CreateRentPost2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Consumer<RentProvider>(
        builder: (context,rent,child) {
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
                                  postTextform(" Price Range", rent.priceController),
                                  SizedBox(height: 20),
                                  postTextform(" BedRooms", rent.bedroomcontroller),
                                  SizedBox(height: 20),
                                  postTextform(" BathRooms", rent.bathroomcontroller),
                                  SizedBox(height: 20),
                                  postTextform(" Car Spaces", rent.carcontroller),
                                  SizedBox(height: 20),
                                  postTextform(" No of people", rent.peoplecontroller),
                                  SizedBox(height: 20),
                                  postTextform(" Land size (m)", rent.landcontroller),
                                  SizedBox(height: 20),
                                  postTextform(" Selling location", rent.sellocationcontroller),
                                  SizedBox(height: 20),
                                  TextFormField(
                                    style: formtextstyle,
                                    controller: rent.premanentaddcontroller,
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => CreateRentPost3()),
                                          );
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
            ],
          );
        }
      ),
    );
  }
}
