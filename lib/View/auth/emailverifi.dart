import 'package:flutter/material.dart';
import 'package:real__ease/View/auth/newpassword.dart';
import 'package:real__ease/core/colorpage.dart';


class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: RealColor.bgcolor,
        foregroundColor: RealColor.textcolor,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: RealColor.bgcolor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Please Check Your Email",
                style: TextStyle(color: RealColor.textcolor, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "We have sent the code to ----------email",
                style: TextStyle(color: RealColor.textcolor),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return Container(
                    width: 50,
                    height: 120,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: RealColor.textcolor,
                        counterText: '',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 170,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    width: screenWidth * 10,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const NewPasswordPage()));
                        },
                        child: const Text(
                          "Verify",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
