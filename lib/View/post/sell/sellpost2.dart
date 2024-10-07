import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/textfeild.dart';
import 'package:real__ease/View/post/sell/sellpost3.dart';
import 'package:real__ease/controller/sellprovider.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

class CreateSellPost2 extends StatelessWidget { 
  String? sellvalue;
   CreateSellPost2({super.key, this. sellvalue,});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Consumer<PostProvider>(
        builder: (context,value,child) {
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
                              "I am looking to sell a property",
                              style: posttext1,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  SizedBox(height: 30),
                                  postTextform(" Price Range", value.priceController),
                                  SizedBox(height: 20),
                                  postTextform(" BedRooms", value.bedroomcontroller),
                                  SizedBox(height: 20),
                                  postTextform(" BathRooms",value.bathroomcontroller),
                                  SizedBox(height: 20),
                                  postTextform(" Car Spaces", value.carcontroller),
                                  SizedBox(height: 20),
                                  postTextform(" No of People", value.peoplecontroller),
                                  SizedBox(height: 20),
                                  postTextform(" Land size (m)",value.landcontroller),
                                  SizedBox(height: 20),
                                  postTextform(" Selling location", value.sellocationcontroller),
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

                                          // print(personaldetails);
                                          print(sellvalue);
                                          print('[[[[[[[[[[[[[[[[[[[[[[[[[///////**************]]]]]]]]]]]]]]]]]]]]]]]]]');
                                          // value.addsellpost(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => CreateSellPost3()),
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
