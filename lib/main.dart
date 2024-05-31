import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:hoodedhaven/Screens/RegisterPage.dart';
import 'package:hoodedhaven/Screens/StorePage.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/AddCard.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/Userinformation.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/Validation.dart';
import 'package:hoodedhaven/Screens/successVerification.dart';
import 'package:hoodedhaven/tools/Products/Store.dart';
import 'package:hoodedhaven/tools/Profile.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:hoodedhaven/Screens/verifyEmail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Store>(create: (_) => Store()),
      ChangeNotifierProvider<Profile>(create: (_) => Profile()),
      ChangeNotifierProvider<Userinformation>(create: (_) => Userinformation()),
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
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            '==================================>User is currently signed out!');
      } else {
        print('================================>User is signed in!');
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Hooded Haven",
          home: FirebaseAuth.instance.currentUser == null
              ? GetStartedPage()
              : bottomnavbar(),
          routes: {
            '/diveinpage': (context) => const GetStartedPage(),
            '/register': (context) => const Register(),
            '/loginpage': (context) => LoginPage(),
            '/bottomnavbar': (context) => const bottomnavbar(),
            '/home': (context) => HomePage(),
            '/store': (context) => const StorePage(),
            '/viewordershistory': (context) => const ViewOrdersHistory(),
            '/favorite': (context) => const Favorite(),
            '/accountsettings': (context) => const AccountSettings(),
            '/verify': (context) => const VerifyEmail(),
            '/Success': (context) => const Success_Verify(),
            '/addCard': (context) => const AddCard(),
            '/validation': (context) => const Validation(),
          },
        );
      },
    );
  }
}
