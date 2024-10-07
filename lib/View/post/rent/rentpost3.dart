import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/post/rent/rentpost4.dart';
import 'package:real__ease/controller/rentprovider.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

enum SingingCharacter { owner, investment, neww, established }
enum PropertyType { house, apartment, multifamily, beachHouse, lakeHouse, cottage, condominium, ranchHouse, loft, mansion, other }

class CreateRentPost3 extends StatefulWidget {
  const CreateRentPost3({super.key});

  @override
  State<CreateRentPost3> createState() => _CreateRentPost3State();
}

class _CreateRentPost3State extends State<CreateRentPost3> {
  SingingCharacter? _character = SingingCharacter.owner;

  // Adding a variable for the selected radio value
  PropertyType? _selectedPropertyType = PropertyType.house;

  // List of feature names for radio buttons
  final Map<PropertyType, String> _featureNames = {
    PropertyType.house: "House",
    PropertyType.apartment: "Apartments",
    PropertyType.multifamily: "Multi-family",
    PropertyType.beachHouse: "Beach-House",
    PropertyType.lakeHouse: "Lake-house",
    PropertyType.cottage: "Cottage",
    PropertyType.condominium: "Condominium",
    PropertyType.ranchHouse: "Ranch-house",
    PropertyType.loft: "Loft",
    PropertyType.mansion: "Mansion",
    PropertyType.other: "Other",
  };

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
                                      "Type of Selling",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: RealColor.textcolor,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // Radio buttons for type of selling
                                    ListTile(
                                      title: Text(
                                        'Owner occupied',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: RealColor.textcolor,
                                        ),
                                      ),
                                      leading: Radio<SingingCharacter>(
                                        value: SingingCharacter.owner,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                            rent.setSellingType(
                                                "Owner occupied"); 
                                          });
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        'Investment',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: RealColor.textcolor,
                                        ),
                                      ),
                                      leading: Radio<SingingCharacter>(
                                        value: SingingCharacter.investment,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                            rent.setSellingType(
                                                "Investment"); 
                                          });
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        'New',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: RealColor.textcolor,
                                        ),
                                      ),
                                      leading: Radio<SingingCharacter>(
                                        value: SingingCharacter.neww,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                            rent.setSellingType(
                                                "New"); 
                                          });
                                        },
                                      ),
                                    ),
                                    ListTile(
                                      title: Text(
                                        'Established',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: RealColor.textcolor,
                                        ),
                                      ),
                                      leading: Radio<SingingCharacter>(
                                        value: SingingCharacter.established,
                                        groupValue: _character,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character = value;
                                            rent.setSellingType(
                                                "Established"); 
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      "Type of Property",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: RealColor.textcolor,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    // Radio buttons for type of property
                                    ..._featureNames.entries.map((entry) {
                                      return ListTile(
                                        title: Text(
                                          entry.value,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: RealColor.textcolor,
                                          ),
                                        ),
                                        leading: Radio<PropertyType>(
                                          value: entry.key,
                                          groupValue: _selectedPropertyType,
                                          onChanged: (PropertyType? value) {
                                            setState(() {
                                              _selectedPropertyType = value;
                                              // Update provider with selected property type
                                              rent.setPropertyType(_featureNames[value!]!);
                                            });
                                          },
                                        ),
                                      );
                                    }).toList(),
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
                                            borderRadius: BorderRadius.circular(35))),
                                    onPressed: () {
                                      // rent.addsellpost(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CreateRentPost4()));
                                    },
                                    child: Text(
                                      "Next",
                                      style: buttonfont,
                                    )),
                              ),
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }, child: Text("Back to Edit",style: buttoncolor,)),
                            )
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
