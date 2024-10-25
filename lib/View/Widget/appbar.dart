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

Widget detailsbar(String title, VoidCallback onEdit) {
  return Padding(
    padding: const EdgeInsets.only(top: 30),
    child: Row(
      children: [
        Image.asset("asset/realblog.png", scale: 4),
        const SizedBox(width: 50),
        Text(title, style: appbarfont1),
        const SizedBox(width: 80),
        TextButton(
          onPressed: onEdit,
          child: const Text(
            "Edit",
            style: TextStyle(color: Color.fromARGB(255, 247, 26, 251), fontSize: 20),
          ),
        ),
      ],
    ),
  );
}