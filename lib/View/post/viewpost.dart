import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/viewdetails.dart';
import 'package:real__ease/View/post/moredetail.dart';
import 'package:real__ease/View/post/paycash.dart';
import 'package:real__ease/controller/rentprovider.dart';
import 'package:real__ease/controller/sellprovider.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';
import 'package:real__ease/model/postmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewPostDetails extends StatefulWidget {
  final PostModel posts; 
  const ViewPostDetails({super.key, required this.posts});

  @override
  State<ViewPostDetails> createState() => _ViewPostDetailsState();
}

class _ViewPostDetailsState extends State<ViewPostDetails> {
  String? profileImageUrl; // Variable to store the profile image URL

  @override
  void initState() {
    super.initState();
    Provider.of<PostProvider>(context, listen: false).getSellingPosts();
    Provider.of<RentProvider>(context, listen: false).getRentPosts();
    _fetchProfileImageUrl(); 
  }

  Future<void> _fetchProfileImageUrl() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('PROFILE')
          .doc(widget.posts.id) // Ensure ownerId exists in PostModel
          .get();

      if (userDoc.exists && userDoc['profileImage'] != null) {
        setState(() {
          profileImageUrl = userDoc['profileImage'];
        });
      }
    } catch (e) {
      print('Error fetching profile image URL: $e');
    }
  }

  void openwhatsapp(String phonenumber, String text) async {
    var url =
        'https://api.whatsapp.com/send?phone=$phonenumber&text=${Uri.encodeComponent(text)}';
    if (await launchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('Could not open WhatsApp: $url');
    }
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          profilebar("Details"),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: PageView.builder(
                            onPageChanged: (int index) {
                              setState(() {
                                currentPage = index;
                              });
                            },
                            itemCount: widget.posts.imageUrls.length,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                  widget.posts.imageUrls[index], // Fetch images from the post
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.error);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(widget.posts.imageUrls.length,
                              (index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: currentPage == index ? 12 : 8, 
                              height: currentPage == index ? 12 : 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentPage == index
                                    ? Colors.white.withOpacity(0.9)
                                    : Colors.white.withOpacity(0.4),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: RealColor.textcolor,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.posts.name, 
                                style: nametext
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.posts.rentandsell, // Rent or Sell info
                                style: hometext,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD76076),
                                foregroundColor: const Color(0xFF0D0F44),
                              ),
                              onPressed: () async {
                                openwhatsapp(
                                    widget.posts.phone.toString(), "hi");
                              },
                              child: const Text("Chat"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Property Details",
                          style: postdetails,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewMoreDetails(
                                        posts: widget.posts)));
                          },
                          child: Text(
                            "More",
                            style: buttoncolor,
                          ),
                        )
                      ],
                    ),
                  ),
                  viewdetails(Icons.bed, "${widget.posts.bed} Bedroom",
                      Icons.currency_rupee, "${widget.posts.price}"),
                  viewdetails(
                      Icons.bathtub,
                      "${widget.posts.bathroom} Bathroom",
                      Icons.person,
                      "${widget.posts.people}"),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        color: RealColor.textcolor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(widget.posts.notes ?? 'No additional notes'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: screenWidth * 2,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: RealColor.buttncolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        onPressed: () {
                          // Navigate to the payment page
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => PayCash( 
                              upiId: "your_upi_id_here", 
                              amount: int.parse(widget.posts.price).toDouble(), // Price from the post
                              regId: widget.posts.id, // Pass relevant registration ID
                            ),
                          ));
                        },
                        child: Text(
                          "Buy the Property",
                          style: buttonfont,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
