import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String id;
  String name;
  String email;
  String phone;
  String address;
  String city;
  String price;
  String bed;
  String bathroom;
  String permanentads;
  String car;
  String people;
  String land;
  String location;
  String typeofselling; 
  String typeofproperty;
  String methodsofselling;
  List<String> outdoor;
  List<String> indoor;
  List<String> climate;
  List<String> imageUrls; // New field for image URLs
  String notes; 
  String rentandsell;

  PostModel(
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.price,
    this.bed,
    this.bathroom,
    this.permanentads,
    this.car,
    this.people,
    this.land,
    this.location,
    this.typeofselling,
    this.typeofproperty,
    this.methodsofselling,
    this.outdoor,
    this.indoor,
    this.climate,
    this.imageUrls, 
    this.notes,
    this.rentandsell 
  );

  
  factory PostModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    
    return PostModel(
      doc.id,
      data['name'] ?? '',
      data['email'] ?? '',
      data['phone'] ?? '',
      data['address'] ?? '',
      data['city'] ?? '',
      data['price'] ?? '',
      data['bed'] ?? '',
      data['bathroom'] ?? '',
      data['permanentads'] ?? '',
      data['car'] ?? '',
      data['people'] ?? '',
      data['land'] ?? '',
      data['location'] ?? '',
      data['typeofselling'] ?? '',
      data['typeofproperty'] ?? '',
      data['methodsofselling'] ?? '',
      List<String>.from(data['outdoor'] ?? []),
      List<String>.from(data['indoor'] ?? []),
      List<String>.from(data['climate'] ?? []),
      List<String>.from(data['imageUrls'] ?? []), 
      data['notes'] ?? '',
      data['rentandsell'] ?? ''
    );
  }
}
