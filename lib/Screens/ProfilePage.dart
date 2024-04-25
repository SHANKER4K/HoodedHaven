import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../tools/ResposiveSize.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Center(
            child: Container(
              height: 150,
              width: 150,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/avatar.jpg"),
              ),
            ),
          ),
          Text(
            "User Name",
            style: TextStyle(fontSize: 20),
          ),
          List_Tile(context, "View Orders History", "viewordershistory"),
          List_Tile(context, "Favorites", "favorite"),
          List_Tile(context, "AccountSettings", "accountsettings"),
          SizedBox(
            height: 20,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
            child: Material(
              elevation: 1.0,
              borderRadius: BorderRadius.circular(8.0),
              child: ListTile(
                trailing: Icon(Icons.exit_to_app),
                title: Text(
                  "Sign Out",
                  style: GoogleFonts.roboto(fontSize: 16),
                ),
                onTap: () async{
                  GoogleSignIn logout = GoogleSignIn();
                  logout.disconnect() ;
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamedAndRemoveUntil(context, '/loginpage', (route) => false);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding List_Tile(BuildContext context, String title, String path) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
      child: Material(
        elevation: 1.0,
        borderRadius: BorderRadius.circular(8.0),
        child: ListTile(
          trailing: Icon(Icons.keyboard_arrow_right_rounded),
          title: Text(
            title,
            style: GoogleFonts.roboto(fontSize: 16),
          ),
          onTap: () => Navigator.pushNamed(context, "/$path"),
        ),
      ),
    );
  }
}
