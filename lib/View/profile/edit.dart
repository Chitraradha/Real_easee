import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/textfeild.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  String? uid;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  // Fetch the current user profile data
  Future<void> fetchUserProfile() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        uid = user.uid;
        DocumentSnapshot userProfile =
            await _db.collection('PROFILE').doc(uid).get();

        if (userProfile.exists) {
          Map<String, dynamic> data =
              userProfile.data() as Map<String, dynamic>;

          // Set the fetched data to the controllers
          nameController.text = data['name'] ?? '';
          phoneController.text = data['phone'] ?? '';
          emailController.text = data['email'] ?? '';
        }
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }

  // Update the user profile with the edited data
  Future<void> updateUserProfile() async {
    try {
      User? user = _auth.currentUser;
      if (user != null && uid != null) {
        // Create a map of updated data
        Map<String, dynamic> updatedData = {
          'name': nameController.text.trim(),
          'phone': phoneController.text.trim(),
          'email': emailController.text.trim(),
        };

        // Update the profile in Firestore
        await _db.collection('PROFILE').doc(uid).update(updatedData);

        // Optionally show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile updated successfully!")),
        );
      }
    } catch (e) {
      print('Error updating user profile: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update profile. Please try again.")),
      );
    }
  }


 

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          profilebar("Edit Profile"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: RealColor.textcolor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      profileTextform(nameController, "Name"),
                      SizedBox(height: 20),
                      profileTextform(emailController, "Email"),
                      SizedBox(height: 20),
                      profileTextform(phoneController, "Phone"),
                      Spacer(), // Use Spacer to push content to the top
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: screenWidth * 0.9,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: RealColor.buttncolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                            onPressed: () {
                              // Call the updateUserProfile function when the button is pressed
                              updateUserProfile();
                            },
                            child: Text("Update", style: buttonfont),
                          ),
                        ),
                        
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
