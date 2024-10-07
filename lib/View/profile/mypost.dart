import 'package:flutter/material.dart';
import 'package:real__ease/View/Widget/appbar.dart';
import 'package:real__ease/core/homeconatiner.dart';

class SeeMyPost extends StatelessWidget {
  const SeeMyPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column(
        children: [
          profilebar("Post"),
          Expanded(child: PostContainer())
        ],
      )
    
    );
  }
}