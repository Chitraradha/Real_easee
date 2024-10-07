import 'package:flutter/material.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/viewdetails.dart';

class ViewMoreDetails extends StatelessWidget {
  const ViewMoreDetails({super.key});

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
                            detailRow(Icons.person, "Name", "OwnerName"),
                            const SizedBox(height: 10),
                            detailRow(Icons.phone, "Phone", "489349832"),
                            const SizedBox(height: 10),
                            detailRow(Icons.location_on, "Address", "abcd"),
                            const SizedBox(height: 10),
                            detailRow(Icons.landscape, "Land Size", "3989m²"),
                            const SizedBox(height: 10),
                            detailRow(Icons.sell, "Type Of Selling", "For Sale"),
                            const SizedBox(height: 10),
                            detailRow(Icons.home, "Property Type", "House"),
                            const SizedBox(height: 10),
                            detailRow(Icons.attach_money, "Selling Method", "Cash"),
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
                            detailRow(Icons.pool, "Outdoor Features", "Swimming Pool"),
                            const SizedBox(height: 10),
                            detailRow(Icons.balcony, "Outdoor Features", "Balcony"),
                            const SizedBox(height: 10),
                            detailRow(Icons.directions_car, "Outdoor Features", "Under Parking"),
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
                            detailRow(Icons.bed, "Indoor Features", "Ensuite"),
                            const SizedBox(height: 10),
                            detailRow(Icons.work, "Indoor Features", "Study Area"),
                          ],
                        ),
                      ),
                    ),

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
                            detailRow(Icons.ac_unit, "Air Conditioning", "Available"),
                            const SizedBox(height: 10),
                            detailRow(Icons.fireplace, "Heating", "Central Heating"),
                            const SizedBox(height: 10),
                            detailRow(Icons.wb_sunny, "Solar Panels", "Installed"),
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
