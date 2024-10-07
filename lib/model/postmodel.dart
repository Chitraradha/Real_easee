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
    this.imageUrls, // Include in constructor
    this.notes,
    this.rentandsell 
  );
}
