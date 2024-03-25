import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:hoodedhaven/Screens/CartPage.dart';
import 'package:hoodedhaven/Screens/ProfilePage.dart';
import '../Screens/HomePage.dart';
import '../Screens/StorePage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: IndexedStack(
              index: currentIndex,
              children: [HomePage(), StorePage(), CartPage(), ProfilePage()]),
          bottomNavigationBar: Bottomnavbar()),
    );
  }

  Container Bottomnavbar() {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: displayWidth * .05),
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
            ),
            const GButton(
              icon: Icons.store_mall_directory,
            ),
            const GButton(
              icon: Icons.shopping_bag,
            ),
            const GButton(
              icon: Icons.person_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
