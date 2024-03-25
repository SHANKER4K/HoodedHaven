import 'package:flutter/material.dart';
import 'package:hoodedhaven/Screens/LoginPage.dart';

import '../tools/ResposiveSize.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a function to convert a design size to a responsive size

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity, // Remove fixed width
            height: double.infinity, // Remove fixed height
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Login.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              // Allow scrolling on smaller screens
              child: Column(
                children: [
                  Container(
                    height: ResponsiveSize.responsiveSize(context, 280),
                    width: ResponsiveSize.responsiveSize(context, 350),
                    margin: EdgeInsets.fromLTRB(
                        0, ResponsiveSize.responsiveSize(context, 424), 0, 0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 242, 239, 224),
                      border: Border.all(color: Colors.black, width: 2.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(14, 16, 13, 0),
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2))),
                              ),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(14, 2, 13, 0),
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2))),
                              ),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(14, 2, 13, 0),
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                scribbleEnabled: false,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                    hintText: "New password",
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 2))),
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          minWidth: 250,
                          height: 50,
                          color: Color.fromARGB(255, 20, 60, 72),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(33)),
                          child: Text("REGISTER"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ));
                          },
                          child: Text(
                            "Login...",
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
