import 'package:flutter/material.dart';
import 'package:real__ease/View/home/homepage.dart';
import 'package:real__ease/View/post/createpost.dart';
import 'package:real__ease/View/profile/mainprofile.dart';
import 'package:real__ease/core/colorpage.dart';

class NavigatorMAain extends StatefulWidget {
  const NavigatorMAain({super.key});

  @override
  State<NavigatorMAain> createState() => _NavigatorMAainState();
}

class _NavigatorMAainState extends State<NavigatorMAain> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePagee(),
    const CreatePostMain(),
    const MainProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: 'Profile',
          ),
        ],
        selectedItemColor: RealColor.buttncolor, // Color of the selected item
        unselectedItemColor: Colors.grey, // Color of the unselected items
        backgroundColor: RealColor.bgcolor, // Set the background color for the bar
      ),
    );
  }
}
