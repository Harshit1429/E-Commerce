import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce/view/AccountPage.dart';
import 'package:ecommerce/view/CartPage.dart';
import 'package:ecommerce/view/HomePage.dart';
import 'package:ecommerce/view/SearchPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final screens = [
    const HomePage(),
    const SearchPage(),
    const CartPage(),
    const AccountPage()
  ];
  int _selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.home, color: Colors.black, fill: 1, size: 30),
          Icon(CupertinoIcons.search, fill: 1, color: Colors.black, size: 28),
          Icon(CupertinoIcons.cart, fill: 1, size: 26),
          Icon(CupertinoIcons.person, fill: 1, size: 26),
        ],
        index: _selectedindex,
        onTap: (index) {
          setState(() {
            _selectedindex = index;
          });
        },
        backgroundColor: Colors.black54,
        animationDuration: const Duration(milliseconds: 380),
        height: 68,
        buttonBackgroundColor: Colors.white,
      ),
      body: screens[_selectedindex],
      extendBody: true,
    );
  }
}
