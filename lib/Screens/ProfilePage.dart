import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoodedhaven/Screens/LoginPage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  File img = File("assets/profileavatar.jpg");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(
            child: SizedBox(
              height: 150,
              width: 150,
              child: CircleAvatar(
                backgroundImage: FileImage(img!),
                child: GestureDetector(
                    onTap: pickimage, child: const Icon(Icons.camera_alt)),
              ),
            ),
          ),
          const Text(
            "User Name",
            style: TextStyle(fontSize: 20),
          ),
          List_Tile(context, "View Orders History", "viewordershistory"),
          List_Tile(context, "Favorites", "favorite"),
          List_Tile(context, "AccountSettings", "accountsettings"),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
            child: Material(
              elevation: 1.0,
              borderRadius: BorderRadius.circular(8.0),
              child: ListTile(
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                title: Text(
                  "Sign Out",
                  style: GoogleFonts.roboto(fontSize: 16),
                ),
                onTap: () {
                  _signOut(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Padding List_Tile(BuildContext context, String title, String path) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
      child: Material(
        elevation: 1.0,
        borderRadius: BorderRadius.circular(8.0),
        child: ListTile(
          trailing: const Icon(Icons.keyboard_arrow_right_rounded),
          title: Text(
            title,
            style: GoogleFonts.roboto(fontSize: 16),
          ),
          onTap: () => Navigator.pushNamed(context, "/$path"),
        ),
      ),
    );
  }

  Future pickimage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      img = File(image!.path);
    });
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Clear any local storage if necessary
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();

      // Navigate to the sign-in screen and remove all previous routes
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/loginpage', (Route<dynamic> route) => false);
    } catch (e) {
      print('Error signing out: $e');
      // You can also show a snackbar or dialog to inform the user of an error
    }
  }
}
