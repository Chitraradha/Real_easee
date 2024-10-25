import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real__ease/model/postmodel.dart';

class ProfileProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<PostModel> yourPosts = [];
  String? idu = FirebaseAuth.instance.currentUser?.uid;

  Future<void> getMyPost() async {
    if (idu == null) return; // Handle the case where user is not logged in

    try {
      final snapshot = await db.collection("Userpost").doc(idu).collection("POST").get();

      if (snapshot.docs.isNotEmpty) {
        yourPosts = snapshot.docs.map((element) {
          return PostModel(
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
            element.get("RentAndSell"),
          );
        }).toList();

        notifyListeners(); 
      }
    } catch (e) {
      print("Error fetching posts: $e"); 
    }
  }

  
}
