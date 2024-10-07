import 'package:flutter/material.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/View/Widget/textfeild.dart';
import 'package:real__ease/View/post/rent/rentpost1.dart';
import 'package:real__ease/View/post/seeall.dart';
import 'package:real__ease/View/post/sell/sellpost1.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';
import 'package:real__ease/core/homeconatiner.dart';


class CreatePostMain extends StatefulWidget {
  const CreatePostMain({super.key});

  @override
  State<CreatePostMain> createState() => _CreatePostMainState();
}

class _CreatePostMainState extends State<CreatePostMain> {
  void _navigateToPage(String titlepost) {
    if (titlepost == "Rent the Property") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateRentPost1()), // Replace with your RentPage
      );
    } else if (titlepost == "Sell the Property") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateSellPost()), // Replace with your SellPage
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appbar(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: RealColor.textcolor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "I am looking to",
                      style: posttext1,
                    ),
                    const SizedBox(height: 20),
                    create_Post("Rent the Property",()=>_navigateToPage("Rent the Property")),
                    const SizedBox(height: 20),
                   create_Post("Sell the Property",()=>_navigateToPage("Sell the Property")),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Top Properties for you",style: buttonrent,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SeeAllPost()));
                  },
                  child: Text("See All",style: buttoncolor,))
              ],
            ),
          ),
      Expanded(child: PostContainer())
      
        ],
      ),
    );
  }
}
