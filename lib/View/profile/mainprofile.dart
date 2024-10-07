import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/textfeild.dart';
import 'package:real__ease/View/auth/login.dart';
import 'package:real__ease/View/profile/edit.dart';
import 'package:real__ease/View/profile/mypost.dart';
import 'package:real__ease/View/profile/privacy.dart';
import 'package:real__ease/View/profile/resetpassword.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({super.key});

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  File? _image; // Variable to store the selected image
  final ImagePicker _picker = ImagePicker(); // ImagePicker instance
  String? _profileImageUrl; // Variable to store the profile image URL

  // Fetch the profile image URL from Firestore
  Future<void> _fetchProfileImageUrl() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('PROFILE')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (userDoc.exists && userDoc['profileImage'] != null) {
        setState(() {
          _profileImageUrl = userDoc['profileImage'];
        });
      }
    } catch (e) {
      print('Error fetching profile image URL: $e');
    }
  }

  // Function to pick an image from the gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Function to upload image to Firebase
  Future<void> _uploadImageToFirebase(File image) async {
    try {
      // Create a reference to the Firebase Storage
      String fileName = 'profile_images/${FirebaseAuth.instance.currentUser!.uid}.jpg';
      Reference storageRef = FirebaseStorage.instance.ref().child(fileName);

      // Upload the file
      UploadTask uploadTask = storageRef.putFile(image);
      TaskSnapshot snapshot = await uploadTask;

      // Get the download URL
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Update Firestore with the image URL
      await FirebaseFirestore.instance.collection('PROFILE').doc(FirebaseAuth.instance.currentUser!.uid).update({
        'profileImage': downloadUrl,
      });

      // Show a Snackbar on successful upload
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Profile image updated successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error uploading image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to upload image!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProfileImageUrl(); // Fetch profile image URL on initialization
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          profilebar("Profile"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 650,
                decoration: BoxDecoration(
                  color: RealColor.textcolor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 90,
                            backgroundImage: _image != null 
                                ? FileImage(_image!) 
                                : _profileImageUrl != null 
                                    ? NetworkImage(_profileImageUrl!) 
                                    : null,
                            child: _image == null && _profileImageUrl == null
                                ? const Icon(
                                    Icons.person,
                                    size: 80,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                _showImageSourceDialog(); // Show dialog to choose image source
                              },
                              child: CircleAvatar(
                                radius: 24,
                                backgroundColor: RealColor.bgcolor,
                                child: const Icon(
                                  Icons.photo_camera_rounded,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text("Chitra", style: profiletext),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          _showUploadImageDialog(); // Show upload image dialog
                        },
                        child: const Text("Upload Profile Image"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: RealColor.buttncolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      textcontainer(context,
                          title: "Edit Profile",
                          navi: EditProfile(),
                          icons: EditProfile()),
                      const SizedBox(height: 20),
                      textcontainer(context,
                          title: "Post",
                          navi: SeeMyPost(),
                          icons: const SeeMyPost()),
                      const SizedBox(height: 20),
                      textcontainer(context,
                          title: "Privacy Policy",
                          navi: PrivacyPolicy(),
                          icons: PrivacyPolicy()),
                      const SizedBox(height: 20),
                      textcontainer(context,
                          title: "Reset Password",
                          navi: ResetProfilePassword(),
                          icons: ResetProfilePassword()),
                      const SizedBox(height: 50),
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
                              _showLogoutDialog(context); // Call the dialog function
                            },
                            child: Text("Logout", style: buttonfont),
                          ),
                        ),
                      ),
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

  // Dialog to choose image source (Gallery or Camera)
  void _showImageSourceDialog() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () {
                    _pickImage(ImageSource.gallery); // Navigate to gallery
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _pickImage(ImageSource.camera); // Navigate to camera
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  // Function to show upload image dialog
  void _showUploadImageDialog() {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select an image first!"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Upload Profile Image"),
          content: const Text("Do you want to upload the selected image?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _uploadImageToFirebase(_image!); // Call the upload function
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Upload"),
            ),
          ],
        );
      },
    );
  }

  // Function to show the confirmation dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Logout"),
          content: const Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Perform the logout action, like navigating to the login page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}
