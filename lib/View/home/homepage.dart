import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/chat/chat.dart';
import 'package:real__ease/View/home/category.dart';
import 'package:real__ease/View/post/seeall.dart';
import 'package:real__ease/controller/rentprovider.dart';
import 'package:real__ease/controller/sellprovider.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';
import 'package:real__ease/core/homeconatiner.dart';

class HomePagee extends StatefulWidget {
  const HomePagee({super.key});

  @override
  State<HomePagee> createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  @override
  void initState() {
    super.initState();
     Provider.of<PostProvider>(context, listen: false).getSellingPosts();
     Provider.of<RentProvider>(context,listen: false).getRentPosts();
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
                      MaterialPageRoute(
                        builder: (context) => const ChathomeScreen(),
                      ),
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
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
            const SizedBox(height: 20),
            const CategorySection(),
            const SizedBox(height: 20),
            Consumer<PostProvider>(
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recently Added", style: buttonfont),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SeeAllPost()),
                        );
                      },
                      child: Text("See All", style: buttoncolor),
                    )
                  ],
                );
              },
            ),
            const Expanded(child: PostContainer())
          ],
        ),
      ),
    );
  }
}
