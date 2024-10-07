import 'package:flutter/material.dart';
import 'package:real__ease/View/chat/chat.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';
import 'package:real__ease/core/homeconatiner.dart';

class SeeAllPost extends StatefulWidget {
  const SeeAllPost({super.key});

  @override
  State<SeeAllPost> createState() => _SeeAllPostState();
}

class _SeeAllPostState extends State<SeeAllPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
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
                            builder: (context) => const ChathomeScreen()));
                  },
                  child: Image.asset(
                    "asset/message.png",
                    scale: 12,
                    color: RealColor.textcolor,
                  ),
                )
              ],
            ),
            Expanded(child: PostContainer())
            ]
        )
      )
    );
  }
}