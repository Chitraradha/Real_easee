
import 'package:flutter/material.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

viewdetails(item1,itemname1,item2,itemname2){
  return  Padding(
              padding: const EdgeInsets.only(left: 30,right: 20,top: 30),
              child: Row(
                children: [
                  Icon(item1,color: RealColor.textcolor,),
                  SizedBox(width: 10,),
                  Text(itemname1,style:buttonfont ,),
                  SizedBox(width: 130,),
                  Icon(item2,color: RealColor.textcolor,),
                  SizedBox(width: 10,),
                  Text(itemname2,style:buttonfont ,)
                ],
              ),
            );

}
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Text(
        title,
        style:  TextStyle(
          color: RealColor.textcolor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget detailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.blueAccent,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "$label: ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }