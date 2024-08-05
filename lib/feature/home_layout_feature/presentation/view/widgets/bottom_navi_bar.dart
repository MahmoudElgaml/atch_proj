import 'package:flutter/material.dart';

class BottomNaviBar extends StatelessWidget {
  const BottomNaviBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedLabelStyle: const TextStyle(fontSize: 14,),
      showUnselectedLabels: true,
      unselectedItemColor: Color(0xff72757E),
      selectedItemColor: Color(0xff5669FF),
      showSelectedLabels: true,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.manage_search, size: 30), label: "Menu"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline, size: 30), label: "wishlist"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30), label: "Account"),
      ],
    );
  }
}
