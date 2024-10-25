import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/profile/detailsedit.dart';
import 'package:real__ease/controller/profileprovider.dart';
import 'package:real__ease/controller/sellprovider.dart';
import 'package:real__ease/core/colorpage.dart';

class SeeMyPost extends StatefulWidget {
  const SeeMyPost({super.key});

  @override
  _SeeMyPostState createState() => _SeeMyPostState();
}

class _SeeMyPostState extends State<SeeMyPost> {
  @override
  void initState() {
    super.initState();
    // Fetching the posts when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
      profileProvider.getMyPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          profilebar("MY Post"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<ProfileProvider>(
                builder: (context, value, child) {
                  if (value.yourPosts.isEmpty) {
                    return Center(
                      child: Text(
                        'No Post Available',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: value.yourPosts.length,
                    itemBuilder: (context, index) {
                      final post = value.yourPosts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditDetails(posts: post),
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
                                    image: NetworkImage(
                                      post.imageUrls.isNotEmpty
                                          ? post.imageUrls[0]
                                          : 'https://via.placeholder.com/150',
                                    ),
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
                                        style: const TextStyle(color: Colors.white),
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
                                                  // Pass the location name
                                                },
                                                icon: Icon(Icons.location_on, color: RealColor.bgcolor),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  // Pass the location name
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
                              Positioned(
                                top: 20,
                                right: 20,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: PopupMenuButton<String>(
                                    onSelected: (String result) {
                                      if (result == 'delete') {
                                        Provider.of<PostProvider>(context, listen: false).deletesellpost(post.id, context);
                                      }
                                    },
                                    itemBuilder: (BuildContext context) => [
                                      PopupMenuItem<String>(
                                        value: 'delete',
                                        child: Row(
                                          children: const [
                                            Icon(Icons.delete, color: Colors.black),
                                            SizedBox(width: 8),
                                            Text('Delete'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
