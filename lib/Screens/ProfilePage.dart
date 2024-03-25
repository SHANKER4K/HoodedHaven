import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
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
          List_Tile(context, "View Orders History"),
          List_Tile(context, "Favorites"),
          List_Tile(context, "Account Settings"),
          SizedBox(
            height: 20,
          ),
          Divider(),
          List_Tile(context, "Sign Out"),
        ],
      ),
    );
  }

  Padding List_Tile(BuildContext context, String title) {
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
          onTap: () => Navigator.pushNamed(context, "/favorite"),
        ),
      ),
    );
  }
}
