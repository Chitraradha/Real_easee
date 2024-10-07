import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/home/navi.dart';
import 'package:real__ease/controller/rentprovider.dart';
import 'package:real__ease/controller/sellprovider.dart';
import 'package:real__ease/core/colorpage.dart';


class CreateRentPost5 extends StatefulWidget {
  const CreateRentPost5({super.key});

  @override
  State<CreateRentPost5> createState() => _CreateRentPost5State();
}

class _CreateRentPost5State extends State<CreateRentPost5> {
  List<File> pickimages = [];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Future<void> _pickAnUploadImages() async {
      ImagePicker imagePicker = ImagePicker();
      List<XFile>? files = await imagePicker.pickMultiImage(
        maxWidth: 1920,
        imageQuality: 80,
      );
      if (files == null) return;

      for (XFile file in files) {
        String uniqueFileNames = DateTime.now().millisecondsSinceEpoch.toString();
        Reference referenceRoot = FirebaseStorage.instance.ref();
        Reference referenceDirImages = referenceRoot.child('image');
        Reference referenceImageToUpload = referenceDirImages.child(uniqueFileNames);
        try {
          await referenceImageToUpload.putFile(File(file.path));
          String imagesUrl = await referenceImageToUpload.getDownloadURL();
          print(imagesUrl);
          print('*****************************************************************');
          
          // Update provider with image URLs
          context.read<RentProvider>().addImageUrl(imagesUrl);

          setState(() {
            pickimages.add(File(file.path));
          });

          // Display message after successful upload
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Image Uploaded'))
          );
        } catch (error) {
          print("Error in uploading");
        }
      }
    }

    return Scaffold(
      body: Column(
        children: [
          appbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
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

                        // Image Upload Section
                        GestureDetector(
                          onTap: _pickAnUploadImages,
                          child: Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: RealColor.textcolor, width: 1),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt,
                                      color: RealColor.bgcolor, size: 40),
                                  SizedBox(height: 10),
                                  Text(
                                    "Add images",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: RealColor.textcolor,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "*Add 3 to 4 images maximum",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Scrollable image preview
                        pickimages.isNotEmpty
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: pickimages.map((image) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          image,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            : Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "No images selected",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                        SizedBox(height: 20),

                        // Notes Section
                        Text(
                          "Notes.........",
                          style: TextStyle(
                            fontSize: 16,
                            color: RealColor.bgcolor,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: RealColor.bgcolor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextField(
                            maxLines: 10,
                            controller: context.read<PostProvider>().notesController, // Link notes to provider
                            decoration: InputDecoration(
                              hintText: 'Write your notes here...',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                            style: TextStyle(color: RealColor.textcolor),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Submit Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: RealColor.buttncolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            minimumSize: Size(screenWidth, 50),
                          ),
                          onPressed: () {
                            String sell='Rent';
                            context.read<RentProvider>().addrentpost(context,sell);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigatorMAain()));
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => NavigatorMAain(),
                            //   ),
                            // );
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: RealColor.textcolor,
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
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
