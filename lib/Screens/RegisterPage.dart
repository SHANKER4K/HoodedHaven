import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hoodedhaven/Screens/LoginPage.dart';
import 'package:hoodedhaven/Screens/RegisterPage.dart';
import 'package:hoodedhaven/Screens/HomePage.dart';
import 'package:hoodedhaven/tools/Resposivesize.dart';
import 'package:flutter_svg/flutter_svg.dart';

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirm = TextEditingController();
final _emailKey = GlobalKey<FormState>();
final _passwordKey = GlobalKey<FormState>();
final _confirmKey = GlobalKey<FormState>();

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final String svgFacebook = '''
  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.0" x="0px" y="0px"
  width="50" height="50" viewBox="0 0 50 50" style="null" class="icon icons8-Facebook-Filled" >
    <path d="M40,0H10C4.486,0,0,4.486,0,10v30c0,5.514,4.486,10,10,10h30c5.514,0,10-4.486,10-10V10C50,4.486,45.514,0,40,0z M39,17h-3
    c-2.145,0-3,0.504-3,2v3h6l-1,6h-5v20h-7V28h-3v-6h3v-3c0-4.677,1.581-8,7-8c2.902,0,6,1,6,1V17z"></path>
  </svg>
  ''';
  final String svgGoogle = '''
  <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="100" height="100" viewBox="0 0 48 48">
<path fill="#FFC107" d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12c0-6.627,5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24c0,11.045,8.955,20,20,20c11.045,0,20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"></path><path fill="#FF3D00" d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"></path><path fill="#4CAF50" d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"></path><path fill="#1976D2" d="M43.611,20.083H42V20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"></path>
</svg>
  ''';
  @override
  Widget build(BuildContext context) {
    String? validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      return value!.isEmpty || !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
    }
    String? validatePassword(String ? value) {
      if (value!.isEmpty) {
        return 'Please enter password';
      } else {
        if (value.length < 7) {
          return 'Enter valid password';
        } else{
          return null;
        }
      }
    }
    String? confirmPassword(String ? value) {
      if (value!.isEmpty) {
        return 'Please comfirm password';
      } else {
         if (value != _password.text) {
          return 'Passwords do not match';
        } else{
          return null;
        }
      }
    }
    Future<void> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if(googleUser == null){
        return ;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
      Navigator.pushNamed(context, '/bottomnavbar') ;
    }
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Column(
            children: [
              //icon
              Center(
                child: SizedBox(
                    height: 250.h,
                    child: Image.asset(
                      "assets/hoodie (3).png",
                      width: 180.w,
                    )),
              ),
              //welcome
              const Text("Welcome to Hooded Haven",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              SizedBox(height: 10.h),
              //username
              inputs(Icons.person, "Email",_email,AutovalidateMode.onUserInteraction,_emailKey,validateEmail),
              SizedBox(height: 10.h),
              //password
              inputs(Icons.lock, "Password",_password,AutovalidateMode.onUserInteraction,_passwordKey,validatePassword),
              SizedBox(height: 10.h),
              //confirm password
              inputs(Icons.lock, "Confirm Password",_confirm ,AutovalidateMode.onUserInteraction,_confirmKey, confirmPassword),
              //signin button
              SizedBox(height: 10.h),
              Container(
                width: 270.w,
                height: 50.h,
                child: Form(
                  child: ElevatedButton(
                    onPressed: () async {
        
                      if( _emailKey.currentState!.validate() && _passwordKey.currentState!.validate() && _confirmKey.currentState!.validate() ){
        
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _email.text,
                          password: _password.text,
                        );
                        Navigator.pushReplacementNamed(context,'/verify');
        
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          print('The account already exists for that email.');
                        }
                      } catch (e) {
                        print(e);
                      }
                      }
                    },                    // register with firebase
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black)),
                    child: const Text(
                      "Register",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),
                    ),
                  ),
                ),
              ),
              //devider
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Or connect with"),
                  ),
                  Expanded(child: Divider())
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {signInWithGoogle();},
                    child: Container(
                      height: 80.r,
                      width: 80.r,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.string(
                          svgGoogle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Log in"))
                ],
              )
            ],
          ),
        ));
  }

  Container inputs(icons, String text , TextEditingController data , AutovalidateMode auto,GlobalKey<FormState> thekey, String? Function(String? value) valid) {
    bool obscureText;
    return Container(
      width: 300.w,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Form(
        key: thekey,
        child: TextFormField(
          controller: data,
          validator: valid,
          autovalidateMode: auto,
          onSaved: (value) {
            data.text = value!;
          },
          style: const TextStyle(
            color: Colors.black,
          ),
          obscureText: obscureText =
          text.toLowerCase().contains("password") ? true : false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icons,
              color: Colors.black,
            ),
            border: InputBorder.none,
            hintMaxLines: 1,
            hintText: text,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ),
      ),
    );
  }
}
