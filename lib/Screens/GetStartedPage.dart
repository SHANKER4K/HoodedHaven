import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hoodedhaven/Screens/LoginPage.dart';
import 'package:hoodedhaven/tools/ResposiveSize.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/Startbackground.jpg"), fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
                0, ResponsiveSize.responsiveSize(context, 536), 0, 0),
            child: Column(
              children: [
                Text(
                  "WELLCOME",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Hussar",
                      fontSize: 37,
                      letterSpacing: -2),
                ),
                Text(
                  "to Hooded Haven \ntrendy hoodies and shoes.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Hussar",
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginpage');
                  },
                  minWidth: 250,
                  height: 50,
                  color: Color.fromARGB(255, 255, 249, 236),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(33)),
                  child: Text("Dive in"),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
