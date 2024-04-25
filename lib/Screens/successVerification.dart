import 'package:flutter/material.dart';

class Success_Verify extends StatefulWidget {
  const Success_Verify({super.key});

  @override
  State<Success_Verify> createState() => _Success_VerifyState();
}

class _Success_VerifyState extends State<Success_Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success_Verification_Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50,),
          Text(
            'WELCOME',
            style: TextStyle(
                fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'welcome to your best distination for shoping , your acount is created ',
            style: TextStyle(
              fontWeight: FontWeight.w200,
              color: Colors.green,
              fontSize: 40,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/bottomnavbar');
            },
            child: Text('continue'),
          )
        ],
      ),
    );
  }
}
