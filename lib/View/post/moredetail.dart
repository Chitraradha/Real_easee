import 'package:flutter/material.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/viewdetails.dart';
import 'package:real__ease/model/postmodel.dart'; // Import your PostModel class

class ViewMoreDetails extends StatelessWidget {
  final PostModel posts; // Pass the PostModel data
  const ViewMoreDetails({super.key, required this.posts});

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
                    // Basic Details Section
                    sectionTitle("Basic Details"),
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
                            detailRow(Icons.person, "Name", posts.name), // Using data from posts
                            const SizedBox(height: 10),
                            detailRow(Icons.phone, "Phone", posts.phone), // Assuming you have this field
                            const SizedBox(height: 10),
                            detailRow(Icons.location_on, "Address", posts.address), // Assuming address field exists
                            const SizedBox(height: 10),
                            detailRow(Icons.landscape, "Land Size", posts.land), // Convert to string if numeric
                            const SizedBox(height: 10),
                            detailRow(Icons.sell, "Type Of Selling", posts.typeofselling), // Rent or Sell info
                            const SizedBox(height: 10),
                            detailRow(Icons.home, "Property Type", posts.typeofproperty), // Assuming propertyType field exists
                            const SizedBox(height: 10),
                            detailRow(Icons.attach_money, "Selling Method", posts.methodsofselling ?? "Not specified"), // Check null case
                          ],
                        ),
                      ),
                    ),
                    
                    // Outdoor Features Section
                    sectionTitle("Outdoor Features"),
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
                            detailRow(Icons.pool, "Swimming Pool", posts.outdoor.contains('Swimming Pool') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.balcony, "Balcony", posts.outdoor.contains('Balcony') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.directions_car, "Undercover Parking", posts.outdoor.contains('Undercover Parking') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.fence, "Fully fenced", posts.outdoor.contains('Fully fenced') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.sports_tennis, "Tennis court", posts.outdoor.contains('Tennis court') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.garage_outlined, "Garage", posts.outdoor.contains('Garage') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.area_chart, "Outdoor Area", posts.outdoor.contains('Outdoor Area') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.shield, "Shed", posts.outdoor.contains('Shed') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.spa_sharp, "Outdoor spa", posts.outdoor.contains('Outdoor spa') ? "Not Available" : "Available"),
                          ],
                        ),
                      ),
                    ),

                    // Indoor Features Section
                    sectionTitle("Indoor Features"),
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
                            detailRow(Icons.bed, "Ensuite", posts.indoor.contains('Ensuite') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.work, "Study Area", posts.indoor.contains('Study Area') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.alarm_sharp, "Alarm System", posts.indoor.contains('Alarm System') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.restaurant_menu, "Rumpus room", posts.indoor.contains('Rumpus room') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.build, "Build in robes", posts.indoor.contains('Build in robes') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.broadcast_on_home, "Broadband", posts.indoor.contains('Broadband') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.sports_gymnastics, "Gym", posts.indoor.contains('Gym') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.shop, "WorkShop", posts.indoor.contains('WorkShop') ? "Not Available" : "Not Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.wifi, "Free Wifi", posts.indoor.contains('Free Wifi') ? "Not Available" : "Available"),
                          ],
                        ),
                      ),
                    ),

                    // Climate Control Section
                    sectionTitle("Climate Control"),
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
                            detailRow(Icons.ac_unit, "Air Conditioning", posts.climate.contains('Air Conditioning') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.fireplace, "Heating", posts.climate.contains('Central Heating') ? "Not Available" : "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.wb_sunny, "Solar Panels", posts.climate.contains('Solar Panels') ? "Not Available" : "Installed"),
                            const SizedBox(height: 10),
                            detailRow(Icons.energy_savings_leaf_rounded, "High Enery efficiency", posts.climate.contains('High Enery efficiency') ? "Not Available" : "Installed"),
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
}
