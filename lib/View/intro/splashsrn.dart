import 'package:flutter/material.dart';
import 'package:real__ease/View/intro/letsgo.dart';
import 'package:real__ease/core/colorpage.dart';


class SplashScreeen extends StatefulWidget {
  const SplashScreeen({super.key});

  @override
  State<SplashScreeen> createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
   @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {}); 
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LetsgoPage()), 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RealColor.bgcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("asset/realblog.png"),
        ],
      ),
    );
  }
}