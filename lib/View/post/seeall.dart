import 'package:flutter/material.dart';
import 'package:real__ease/View/chat/chat.dart';
import 'package:real__ease/controller/rentprovider.dart';
import 'package:real__ease/controller/sellprovider.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';
import 'package:real__ease/core/homeconatiner.dart';
import 'package:provider/provider.dart'; // Import provider for accessing state
 // Ensure this imports your PostContainer

class SeeAllPost extends StatefulWidget {
  const SeeAllPost({super.key});

  @override
  State<SeeAllPost> createState() => _SeeAllPostState();
}

class _SeeAllPostState extends State<SeeAllPost> {
  TextEditingController searchController = TextEditingController();
  String searchKey = ''; // Search controller

  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).getSellingPosts();
    Provider.of<RentProvider>(context, listen: false).getRentPosts();
  }

  void onSearchChanged() {
    setState(() {
      searchKey = searchController.text; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "asset/realblog.png",
                  scale: 4,
                ),
                Text(
                  "REAL EASE",
                  style: appbarfont1,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChathomeScreen()),
                    );
                  },
                  child: Image.asset(
                    "asset/message.png",
                    scale: 12,
                    color: RealColor.textcolor,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: searchController, // Assign controller
              onChanged: (value) => onSearchChanged(), // Call onSearchChanged on text change
              decoration: InputDecoration(
                hintText: 'Search by location...',
                hintStyle: TextStyle(color: RealColor.bgcolor),
                filled: true,
                fillColor: RealColor.textcolor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: RealColor.bgcolor),
              ),
            ),
            Expanded(
              child: PostContainer(searchKey: searchController.text), // Pass searchKey to PostContainer
            ),
          ],
        ),
      ),
    );
  }
}
