import 'package:flutter/material.dart';
import 'package:real__ease/View/auth/emailverifi.dart';
import 'package:real__ease/core/colorpage.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: RealColor.bgcolor,
        foregroundColor: RealColor.textcolor,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: RealColor.bgcolor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forgot Password",style: TextStyle(color: RealColor.textcolor,fontSize: 25),),
              SizedBox(height: 10,),
              Text("Enter the email address with your account and we'll send an email with confirmation to reset your password.",style: TextStyle(color: RealColor.textcolor),),
              SizedBox(height: 20,),
              TextFormField(
                style: TextStyle(color: RealColor.textcolor),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: RealColor.textcolor),
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height:170,),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: screenWidth*10,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailVerificationPage()));
                    }, child: Text("Send Code",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}