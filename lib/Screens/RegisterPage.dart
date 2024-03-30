// ignore_for_file: depend_on_referenced_packages
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hoodedhaven/Screens/login_page.dart';
import 'package:hoodedhaven/tools/Resposivesize.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a function to convert a design size to a responsive size
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity, // Remove fixed width
            height: double.infinity, // Remove fixed height
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/tester.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.4,sigmaY: 1.4),
              child: Center(
                        child: SingleChildScrollView(
              // Allow scrolling on smaller screens
              child: Column(
                children: [
                  
                  Container(
                    height: ResponsiveSize.responsiveSize(context, 640),
                    width: ResponsiveSize.responsiveSize(context, 500),
                    margin: const EdgeInsets.only(top:60 ,),
                    padding: const EdgeInsets.only(top: 85,bottom: 10,),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 247, 228, 0),
                      border: Border.all(color: const Color.fromRGBO(255, 247, 228, 0), width: 2.0),
                      
                    ),
                    child: Column(
                      children: [
                        
                         const Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color:  Color.fromRGBO(229, 186, 143, 8),
                              ),
                        ),
                        const SizedBox(height: 20,),
                         Container(
                          height: size.width / 10,
                          width: size.width / 1.65,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: size.width / 30),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            style: TextStyle(
                            color: Colors.white.withOpacity(.9),
                            ),
                        
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white.withOpacity(.8),
                          ),
                          border: InputBorder.none,
                          hintMaxLines: 1,
                          hintText: "User  Name",
                          hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(.8),
                          ),
                          ),
                          ),
                          ),              
                        Container(
                        
                          height: size.width / 10,
                          width: size.width / 1.65,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: size.width / 30),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.1),
                            borderRadius: BorderRadius.circular(20),
                            
                          ),
                          child: TextField(
                            style: TextStyle(
                            color: Colors.white.withOpacity(.9),
                            ),
                        
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.white.withOpacity(.8),
                          ),
                          border: InputBorder.none,
                          hintMaxLines: 1,
                          hintText: "Email",
                          hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(.8),
                          ),
                          ),
                          ),
                          ),
                          const SizedBox(height: 7,),
                          //password
                        Container(
                          height: size.width / 10,
                          width: size.width / 1.65,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: size.width / 30),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextField(
                            style: TextStyle(
                            color: Colors.white.withOpacity(.9),
                            ),
                        
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.white.withOpacity(.8),
                          ),
                          border: InputBorder.none,
                          hintMaxLines: 1,
                          hintText: "Password",
                          hintStyle: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(.8),
                          ),
                          ),
                          ),
                          ),
                        const SizedBox(
                          height: 72,
                        ),
                        //minWidth: 250,
                          //height: 50,
                        MaterialButton(
                    onPressed: () {
                      
                    },
                    minWidth: 250,
                    height: 50,
                    color: const Color.fromRGBO(229, 186, 143, 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(33)),
                    child: const Text("Register"),
                  ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                          },
                          child: const Text(
                            "I Already Have An Account   ",
                            style: TextStyle(color: Colors.white54),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
                        ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
