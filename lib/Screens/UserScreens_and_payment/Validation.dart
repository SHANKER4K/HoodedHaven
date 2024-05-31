import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/Address.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/Card.dart';
import 'package:hoodedhaven/Screens/UserScreens_and_payment/Userinformation.dart';
import 'package:hoodedhaven/tools/myColor.dart';
import 'package:provider/provider.dart';

class Validation extends StatelessWidget {
  const Validation({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<Userinformation>(builder: (context, user, child) {
      int code;
      if (user.selectedCard != null &&
          user.selectedCard!.cardNumber.isNotEmpty) {
        code = user.selectedCard!.cardNumber.length - 5;
      } else {
        // Handle the case where user.selectedCard or cardNumber is null or empty
        print("Selected card or card number is invalid");
        // You can assign a default value to code here if needed
      }
      return Scaffold(
        backgroundColor: myColors.primaryColor,
        body: Column(
          children: [
            SizedBox(height: 50),
            Text(
              "Your Address",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Container(
              width: 400,
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("      ${user.selectedAddress?.addressFullName}"),
                    SizedBox(height: 10),
                    Text(
                        "      ${user.selectedAddress?.country}, ${user.selectedAddress?.city}"),
                    SizedBox(height: 10),
                    Text("      ${user.selectedAddress?.streetname}"),
                  ]),
            ),
            SizedBox(height: 50),
            Text("Your Card",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            Container(
              width: 400,
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "      **** ${user.selectedCard?.cardNumber.substring(10)}"),
                    SizedBox(height: 10),
                    Text(
                        "      ${user.selectedAddress?.country}, ${user.selectedAddress?.city}"),
                    SizedBox(height: 10),
                    Text("      ${user.selectedAddress?.streetname}"),
                  ]),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(onPressed: () {}, child: Text("Pay")))
          ],
        ),
      );
    });
  }
}
