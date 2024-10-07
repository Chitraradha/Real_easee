import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/post/rent/rentpost5.dart';
import 'package:real__ease/controller/rentprovider.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

enum SingingCharacter { check, cash }

class CreateRentPost4 extends StatefulWidget {
  const CreateRentPost4({super.key});

  @override
  State<CreateRentPost4> createState() => _CreateRentPost4State();
}

class _CreateRentPost4State extends State<CreateRentPost4> {
  SingingCharacter? _character = SingingCharacter.cash;

  // Adding a list of boolean values for the checkboxes
  List<bool> _checkboxValues = List<bool>.filled(9, false);

  // List of outdoor feature names
  final List<String> _featureOutdoor = [
    "Swimming pool",
    "Balcony",
    "Undercover parking",
    "Fully fenced",
    "Tennis court",
    "Garage",
    "Outdoor area",
    "Shed",
    "Outdoor spa",
  ];

  // Indoor feature checkboxes
  List<bool> _checkboxValues2 = List<bool>.filled(8, false);

  // List of indoor feature names
  final List<String> _featureIndoor = [
    "Ensite",
    "Study Area",
    "Alarm system",
    "Rumpus Rooms",
    "Built in robes",
    "Gym",
    "Workshop",
    "Free Wifi",
  ];

  // Climate feature checkboxes
  List<bool> _checkboxValues3 = List<bool>.filled(4, false);

  // List of climate feature names
  final List<String> _featureClimate = [
    "Air Conditioning",
    "Heating",
    "Solar Panels",
    "High Energy efficiency",
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer<RentProvider>(
        builder: (context, rent, child) {
          return Column(
            children: [
              appbar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: RealColor.textcolor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "I am looking to sell a property",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: RealColor.bgcolor,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: RealColor.bgcolor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20, left: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Selling method",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: RealColor.textcolor,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // Simplified radio buttons
                                    ListTile(
                                      title: Text(
                                        'Cash',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: RealColor.textcolor,
                                        ),
                                      ),
                                      leading: Radio<SingingCharacter>(
                                        value: SingingCharacter.cash,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                            rent.setSellingMethods("Cash");
                                          });
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        'Check',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: RealColor.textcolor,
                                        ),
                                      ),
                                      leading: Radio<SingingCharacter>(
                                        value: SingingCharacter.check,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                            rent.setSellingMethods("Check");
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Outdoor features",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: RealColor.textcolor,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ..._checkboxValues.asMap().entries.map((entry) {
                                      int index = entry.key;
                                      bool value = entry.value;
                                      return ListTile(
                                        title: Text(
                                          _featureOutdoor[index],
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: RealColor.textcolor,
                                          ),
                                        ),
                                        leading: Checkbox(
                                          value: value,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              _checkboxValues[index] = newValue!;
                                              rent.toggleOutdoorfeatures(_featureOutdoor[index]);
                                            });
                                          },
                                          activeColor: RealColor.textcolor,
                                          checkColor: RealColor.bgcolor,
                                        ),
                                      );
                                    }),
                                    SizedBox(height: 20),
                                    Text(
                                      "Indoor features",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: RealColor.textcolor,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ..._checkboxValues2.asMap().entries.map((entry) {
                                      int index = entry.key;
                                      bool value = entry.value;
                                      return ListTile(
                                        title: Text(
                                          _featureIndoor[index],
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: RealColor.textcolor,
                                          ),
                                        ),
                                        leading: Checkbox(
                                          value: value,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              _checkboxValues2[index] = newValue!;
                                              rent.toggleIndoorfeatures(_featureIndoor[index]); // Toggle indoor features
                                            });
                                          },
                                          activeColor: RealColor.textcolor,
                                          checkColor: RealColor.bgcolor,
                                        ),
                                      );
                                    }),
                                    SizedBox(height: 20),
                                    Text(
                                      "Climate control & energy",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: RealColor.textcolor,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ..._checkboxValues3.asMap().entries.map((entry) {
                                      int index = entry.key;
                                      bool value = entry.value;
                                      return ListTile(
                                        title: Text(
                                          _featureClimate[index],
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: RealColor.textcolor,
                                          ),
                                        ),
                                        leading: Checkbox(
                                          value: value,
                                          onChanged: (bool? newValue) {
                                            setState(() {
                                              _checkboxValues3[index] = newValue!;
                                              rent.toggleClimatefeatures(_featureClimate[index]); // Toggle climate features
                                            });
                                          },
                                          activeColor: RealColor.textcolor,
                                          checkColor: RealColor.bgcolor,
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
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
                                        MaterialPageRoute(
                                            builder: (context) => CreateRentPost5(  )));
                                  },
                                  child: Text("Next", style: buttonfont),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
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
