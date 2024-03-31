import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hoodedhaven/Buttomnavbar/Buttomnavbar.dart';
import 'package:hoodedhaven/Screens/ProfileScreens/Favorites.dart';
import 'package:hoodedhaven/Screens/GetStartedPage.dart';
import 'package:hoodedhaven/Screens/HomePage.dart';
import 'package:hoodedhaven/Screens/LoginPage.dart';
import 'package:hoodedhaven/Screens/LoginPage.dart';
import 'package:hoodedhaven/Screens/ProfileScreens/accountSettings.dart';
import 'package:hoodedhaven/Screens/ProfileScreens/viewOrdersHistory.dart';
import 'package:hoodedhaven/Screens/StorePage.dart';
import 'package:hoodedhaven/tools/Products/Store.dart';
import 'package:hoodedhaven/tools/Profile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Store>(create: (_) => Store()),
      ChangeNotifierProvider<Profile>(create: (_) => Profile()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Hooded Haven",
          home: GetStartedPage(),
          routes: {
            '/diveinpage': (context) => const GetStartedPage(),
            '/loginpage': (context) => const LoginPage(),
            '/bottomnavbar': (context) => const bottomnavbar(),
            '/home': (context) => HomePage(),
            '/store': (context) => const StorePage(),
            '/viewordershistory': (context) => const ViewOrdersHistory(),
            '/favorite': (context) => const Favorite(),
            '/accountsettings': (context) => const AccountSettings(),
          },
        );
      },
    );
  }
}
