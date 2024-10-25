import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/post/viewpost.dart';
import 'package:real__ease/controller/sellprovider.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:url_launcher/url_launcher.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({super.key, required this.searchKey}); // Add searchKey to constructor

  final String searchKey; // Store the searchKey

  static Future<void> openMap(String location) async {
    // Encode the location to ensure it is URL-friendly
    final String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(location)}';
    try {
      await launchUrl(Uri.parse(googleUrl));
    } catch (e) {
      log('Error opening map: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<PostProvider>(
        builder: (context, value, child) {
          // Filter posts based on searchKey
          final filteredPosts = value.sellingPosts.where((post) {
            return post.location.toLowerCase().contains(searchKey.toLowerCase());
          }).toList();

          if (filteredPosts.isEmpty) {
            return Center(
              child: Text(
                'No posts available.',
                style: TextStyle(color: Colors.amber, fontSize: 20),
              ),
            );
          }

          return ListView.builder(
            itemCount: filteredPosts.length,
            itemBuilder: (context, index) {
              final post = filteredPosts[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewPostDetails(posts: post),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(post.imageUrls.isNotEmpty
                                ? post.imageUrls[0]
                                : 'https://via.placeholder.com/150'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 250,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(20),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                              decoration: BoxDecoration(
                                color: RealColor.buttncolor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                post.rentandsell,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(253, 247, 245, 245).withOpacity(0.6),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        post.name,
                                        style: TextStyle(color: RealColor.bgcolor, fontSize: 18),
                                      ),
                                      const SizedBox(width: 100),
                                      Icon(Icons.bed, color: RealColor.bgcolor, size: 18),
                                      const SizedBox(width: 4),
                                      Text(post.bed.toString(), style: TextStyle(color: RealColor.bgcolor)),
                                      const SizedBox(width: 16),
                                      Icon(Icons.bathtub, color: RealColor.bgcolor, size: 18),
                                      const SizedBox(width: 4),
                                      Text(post.bathroom.toString(), style: TextStyle(color: RealColor.bgcolor)),
                                      const SizedBox(width: 16),
                                      Icon(Icons.person, color: RealColor.bgcolor, size: 18),
                                      const SizedBox(width: 4),
                                      Text(post.bed.toString(), style: TextStyle(color: RealColor.bgcolor)),
                                      const SizedBox(width: 4),
                                      Text('|', style: TextStyle(color: RealColor.bgcolor)),
                                      const SizedBox(width: 4),
                                      Text(post.typeofproperty, style: TextStyle(color: RealColor.bgcolor)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          openMap(post.location); // Pass the location name
                                        },
                                        icon: Icon(Icons.location_on, color: RealColor.bgcolor),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          openMap(post.location); // Pass the location name
                                        },
                                        child: Text(
                                          post.location,
                                          style: TextStyle(color: RealColor.bgcolor, fontSize: 14),
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        post.price.toString(),
                                        style: TextStyle(
                                          color: RealColor.bgcolor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Positioned(
                      //   top: 20,
                      //   right: 20,
                      //   child: CircleAvatar(
                      //     backgroundColor: Colors.white,
                      //     child: IconButton(
                      //       icon: const Icon(Icons.favorite_border, color: Colors.black),
                      //       onPressed: () {}, // Implement favorite functionality
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
