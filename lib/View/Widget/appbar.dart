import 'package:flutter/material.dart';
import 'package:real__ease/core/fontfamily.dart';

appbar() {
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Row(
      
      children: [
        Image.asset("asset/realblog.png",scale:4,),
        SizedBox(width: 50,),
        Text("Create Post",style: appbarfont1,)
      ],
    ),
  );
}

profilebar(title) {
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Row(
      
      children: [
        Image.asset("asset/realblog.png",scale:4,),
        SizedBox(width: 50,),
        Text(title,style: appbarfont1,)
      ],
    ),
  );
}