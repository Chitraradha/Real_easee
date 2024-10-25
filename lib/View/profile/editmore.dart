import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firebase Firestore
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/viewdetails.dart';
import 'package:real__ease/model/postmodel.dart'; // Import your PostModel class

class EditMoreDetails extends StatelessWidget {
  final PostModel posts; // Pass the PostModel data
  const EditMoreDetails({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          profilebar("Details"),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    sectionProfileTitle("Basic Details"),
                    Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            detailRow(Icons.person, "Name", posts.name, () => _showEditDialog(context, 'Name', posts.name, (value) {
                              _updatePostField('name', value);
                            })),
                            const SizedBox(height: 10),
                            detailRow(Icons.phone, "Phone", posts.phone, () => _showEditDialog(context, 'Phone', posts.phone, (value) {
                              _updatePostField('phone', value);
                            })),
                            const SizedBox(height: 10),
                            detailRow(Icons.location_on, "Address", posts.address, () => _showEditDialog(context, 'Address', posts.address, (value) {
                              _updatePostField('address', value);
                            })),
                            const SizedBox(height: 10),
                            detailRow(Icons.landscape, "Land Size", posts.land.toString(), () => _showEditDialog(context, 'Land Size', posts.land.toString(), (value) {
                              _updatePostField('land', value);
                            })),
                            const SizedBox(height: 10),
                          
                           detailRow(Icons.sell, "Type Of Selling", posts.typeofselling), // Rent or Sell info
                            const SizedBox(height: 10),
                            detailRow(Icons.home, "Property Type", posts.typeofproperty), // Assuming propertyType field exists
                            const SizedBox(height: 10),
                            detailRow(Icons.attach_money, "Selling Method", posts.methodsofselling ?? "Not specified"),
                          
                            
                          ],
                        ),
                      ),
                    ),
                    // Outdoor Features Section
                    sectionProfileTitle("Outdoor Features"),
                    Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            detailRow(Icons.pool, "Swimming Pool", posts.outdoor.contains('Swimming Pool') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.balcony, "Balcony", posts.outdoor.contains('Balcony') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.directions_car, "Undercover Parking", posts.outdoor.contains('Undercover Parking') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.fence, "Fully fenced", posts.outdoor.contains('Fully fenced') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.sports_tennis, "Tennis court", posts.outdoor.contains('Tennis court') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.garage_outlined, "Garage", posts.outdoor.contains('Garage') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.area_chart, "Outdoor Area", posts.outdoor.contains('Outdoor Area') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.shield, "Shed", posts.outdoor.contains('Shed') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.spa_sharp, "Outdoor spa", posts.outdoor.contains('Outdoor spa') ? "Available" : "Not Available"),
                          ],
                        ),
                      ),
                    ),

                    // Indoor Features Section
                    sectionProfileTitle("Indoor Features"),
                    Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            detailRow(Icons.bed, "Ensuite", posts.indoor.contains('Ensuite') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.work, "Study Area", posts.indoor.contains('Study Area') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.alarm_sharp, "Alarm System", posts.indoor.contains('Alarm System') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.restaurant_menu, "Rumpus room", posts.indoor.contains('Rumpus room') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.build, "Build in robes", posts.indoor.contains('Build in robes') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.broadcast_on_home, "Broadband", posts.indoor.contains('Broadband') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.sports_gymnastics, "Gym", posts.indoor.contains('Gym') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.shop, "WorkShop", posts.indoor.contains('WorkShop') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.wifi, "Free Wifi", posts.indoor.contains('Free Wifi') ? "Available" : "Not Available"),
                          ],
                        ),
                      ),
                    ),

                    // Climate Control Section
                    sectionProfileTitle("Climate Control"),
                    Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            detailRow(Icons.ac_unit, "Air Conditioning", posts.climate.contains('Air Conditioning') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.fireplace, "Heating", posts.climate.contains('Central Heating') ? "Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.wb_sunny, "Solar Panels", posts.climate.contains('Solar Panels') ? "Available" : "Not Installed"),
                            const SizedBox(height: 10),
                            detailRow(Icons.energy_savings_leaf_rounded, "High Energy Efficiency", posts.climate.contains('High Energy Efficiency') ? "Available" : "Not Installed"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to show edit dialog
  void _showEditDialog(BuildContext context, String title, String initialValue, Function(String) onUpdate) {
    final TextEditingController controller = TextEditingController(text: initialValue);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $title'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter new $title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                onUpdate(controller.text);
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Update'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Method to update a field in Firestore
  Future<void> _updatePostField(String fieldName, String newValue) async {
    try {
      // Assuming you have the post's document ID
      String documentId = posts.id; // Replace with the actual way to get the ID
      await FirebaseFirestore.instance.collection('POST').doc(documentId).update({fieldName: newValue});
    } catch (e) {
      print("Error updating field: $e");
    }
  }

  // Helper method to create a detail row
  Widget detailRow(IconData icon, String title, String value, [VoidCallback? onTap]) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$title: $value',
              style: TextStyle(fontSize: 16),
            ),
          ),
          if (onTap != null) Icon(Icons.edit),
        ],
      ),
    );
  }

  // Helper method to create section title
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
