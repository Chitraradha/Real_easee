import 'package:flutter/material.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';

loginTextform(labeltext, controll) {
  return TextFormField(
    style: formtextstyle,
    controller: controll,
    decoration: InputDecoration(
        labelText: labeltext,
        labelStyle: formtexthit,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: RealColor.textcolor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(40))),
  );
}

create_Post(titlepost,onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: RealColor.bgcolor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10), 
          Text(
            titlepost,
            style: posttext2,
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon:  Icon(Icons.navigate_next_outlined,size: 40,color: RealColor.textcolor,))
        ],
      ),
    ),
  );
}

postTextform(labeltext, controll) {
  return TextFormField(
    style: formtextstyle,
    controller: controll,
    decoration: InputDecoration(
        hintText: labeltext,
        fillColor: RealColor.bgcolor,
        filled: true,
        hintStyle: formtexthit,
        border: OutlineInputBorder(
            borderSide: BorderSide(
              color: RealColor.textcolor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(40))),
  );
}

textcontainer(context,{required title, required navi,required icons}){

  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>navi));
    },
    child: Container(
      height: 70,
      width: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(title,style: profiletext,),
          IconButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>icons));
          }, icon: Icon(Icons.arrow_forward_ios_rounded,size: 40,))
        ],),
      ),
    ),
  );

}

profileTextform(labeltext) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 450,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20,),
            child: Text(labeltext,style: profiletext),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.edit))
        ],
      ),
    ),
  );
}

ResetPassTextform(labeltext) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 450,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:20,),
            child: Text(labeltext,style: profiletext),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye))
        ],
      ),
    ),
  );
}

