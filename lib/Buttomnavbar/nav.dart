import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    var currentIndex = 0;
    return Container(
      margin: EdgeInsets.all(displayWidth * .05),
      height: displayWidth * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GNav(
          color: Colors.black,
          activeColor: Colors.black,
          tabBackgroundColor: Colors.blueAccent.withOpacity(0.2),
          gap: 2,
          onTabChange: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          tabs: [
            const GButton(
              icon: Icons.home_rounded,
              text: "Home",
            ),
            const GButton(
              icon: Icons.store_mall_directory,
              text: "Store",
            ),
            const GButton(
              icon: Icons.shopping_bag,
              text: "Cart",
            ),
            const GButton(
              icon: Icons.person_rounded,
              text: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
