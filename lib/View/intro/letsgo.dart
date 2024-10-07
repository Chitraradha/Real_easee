import 'package:flutter/material.dart';
import 'package:real__ease/View/auth/signup.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/core/fontfamily.dart';


class LetsgoPage extends StatelessWidget {
  const LetsgoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width * 0.4;

    return Scaffold(
      backgroundColor: RealColor.bgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("asset/realblog.png"),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text(
                "MANAGE",
                style: letgofont1
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 90),
              child: Text(
                "MONITOR",
                style: letgofont1
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "AND",
              style: letgofont1
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: Text(
                "MAXIMIZE",
                style: letgofont1
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "YOUR RENTALS",
              style: letgofont2
            ),
            SizedBox(height: 40,),
            SizedBox(
                width: screenWidth,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: RealColor.buttncolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUppage()));
                    },
                    child: Text(
                      "LET'S GO",
                      style: buttonfont
                    ))),
          ],
        ),
      ),
    );
  }
}
