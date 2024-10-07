import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:real__ease/model/postmodel.dart';

class RentProvider extends ChangeNotifier{
   final FirebaseFirestore db = FirebaseFirestore.instance;

  TextEditingController pnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController bedroomcontroller = TextEditingController();
  TextEditingController bathroomcontroller = TextEditingController();
  TextEditingController premanentaddcontroller = TextEditingController();
  TextEditingController carcontroller = TextEditingController();
  TextEditingController peoplecontroller = TextEditingController();
  TextEditingController landcontroller = TextEditingController();
  TextEditingController sellocationcontroller = TextEditingController();
  TextEditingController notesController = TextEditingController(); 
   late String rentandsell;

  List<String> imagesUrls = []; // List for image URLs

  String? selectedSellingType;
  String? selectedPropertyType;
  String? methodsofselling;
  List<String> outdoorfeatures = [];
  List<String> indoorfeatures = [];
  List<String> climatefeatures = [];

  void setSellingType(String type) {
    selectedSellingType = type;
    notifyListeners();
  }

  void setPropertyType(String property) {
    selectedPropertyType = property;
    notifyListeners();
  }

  void setSellingMethods(String method) {
    methodsofselling = method;
    notifyListeners();
  }

  // Function to toggle outdoor features
  void toggleOutdoorfeatures(String outdoor) {
    if (outdoorfeatures.contains(outdoor)) {
      outdoorfeatures.remove(outdoor);
    } else {
      outdoorfeatures.add(outdoor);
    }
    notifyListeners();
  }

  // Function to toggle indoor features
  void toggleIndoorfeatures(String indoor) {
    if (indoorfeatures.contains(indoor)) {
      indoorfeatures.remove(indoor);
    } else {
      indoorfeatures.add(indoor);
    }
    notifyListeners();
  }

  // Function to toggle climate features
  void toggleClimatefeatures(String climate) {
    if (climatefeatures.contains(climate)) {
      climatefeatures.remove(climate);
    } else {
      climatefeatures.add(climate);
    }
    notifyListeners();
  }

  
  void addrentpost(BuildContext context,String rentandsell) {
    String pid = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> map = HashMap();
    map["pname"] = pnamecontroller.text;
    map["pemail"] = emailcontroller.text;
    map["Pphone"] = phonecontroller.text;
    map['paddress'] = addresscontroller.text;
    map['city'] = citycontroller.text;
    map["price"] = priceController.text;
    map["bed"] = bedroomcontroller.text;
    map["bath"] = bathroomcontroller.text;
    map["permanentads"] = premanentaddcontroller.text;
    map["car"] = carcontroller.text;
    map["time"] = peoplecontroller.text;
    map["land"] = landcontroller.text;
    map["sellloc"] = sellocationcontroller.text;
    map["typeofselling"] = selectedSellingType ?? "N/A";
    map["typeofproperty"] = selectedPropertyType ?? "N/A";
    map["sellingmethod"] = methodsofselling ?? "N/A";
    map["Outdoor"] = outdoorfeatures.join(", ");
    map["Indoor"] = indoorfeatures.join(", "); // Store indoor features
    map["Climate"] = climatefeatures.join(", "); // Store climate features
    map["Images"] = imagesUrls; 
    map["Notes"] = notesController.text; 
    map["RentAndSell"]=rentandsell;

    db.collection("POST").doc(pid).set(map);
  }

  
  void addImageUrl(String url) {
    imagesUrls.add(url);
    notifyListeners();
  }

  
  void postClear(){
    pnamecontroller.clear();
    emailcontroller.clear();
    phonecontroller.clear();
    addresscontroller.clear();
    citycontroller.clear();
    priceController.clear();
    bedroomcontroller.clear();
    bathroomcontroller.clear();
    premanentaddcontroller.clear();
    carcontroller.clear();
    peoplecontroller.clear();
    landcontroller.clear();
    sellocationcontroller.clear();
    notesController.clear();
    imagesUrls.clear(); // Clear the image URLs
    outdoorfeatures.clear(); // Clear the outdoor features
    indoorfeatures.clear(); // Clear the indoor features
    climatefeatures.clear(); // Clear the climate features
    notifyListeners();
  }

 List<PostModel>rentingPosts=[];
  bool isLoading = false;
  String? errorMessage;
  void getRentPosts(){

    db.collection("POST").get().then((value){

      if(value.docs.isNotEmpty){
        rentingPosts.clear();
        for(var element in value.docs){
          rentingPosts.add(
            PostModel(
            element.id,
            element.get("pname"),
            element.get("pemail"),
            element.get("Pphone"),
            element.get("paddress"),
            element.get("city"),
            element.get("price"),
            element.get("bed"),
            element.get("bath"),
            element.get("permanentads"),
            element.get("car"),
            element.get("time"),
            element.get("land"),
            element.get("sellloc"),
            element.get("typeofselling"),
            element.get("typeofproperty"),
            element.get("sellingmethod"),
            element.get("Outdoor").split(", "),
            element.get("Indoor").split(", "),
            element.get("Climate").split(", "),
            List<String>.from(element.get("Images")),
            element.get("Notes"),
            element.get("RentAndSell")
          )
          );
          notifyListeners();
        } notifyListeners();
      }
    });
  }
}