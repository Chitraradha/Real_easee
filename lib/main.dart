import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:real__ease/View/intro/splashsrn.dart';
import 'package:real__ease/controller/rentprovider.dart';
import 'package:real__ease/controller/sellprovider.dart';
import 'package:real__ease/controller/homeprovider.dart';
import 'package:real__ease/core/colorpage.dart';
import 'package:real__ease/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>PostProvider()),
        ChangeNotifierProvider(create: (context)=>TypeofpropertyCategory()),
        ChangeNotifierProvider(create: (context)=>RentProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: RealColor.bgcolor
        ),
        home: SplashScreeen()
      ),
    );
  }
}

