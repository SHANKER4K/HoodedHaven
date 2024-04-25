import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});
  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final _auth = FirebaseAuth.instance;
  late User _user;
  late Timer _timer;
  @override
  void initState() {
    _user = _auth.currentUser!;
    _user.sendEmailVerification();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      checkVerification();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VerifyEmailScreen'),
      ),
      body: Container(
        child: Center(
          child: Text(
            'an email has been sent to ${_user.email} pls verify',
            style: TextStyle(
              fontSize: 30 ,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> checkVerification() async {
    _user = _auth.currentUser!;
    await _user.reload();
    if (_user.emailVerified) {
      _timer.cancel();
      Navigator.pushReplacementNamed(context, '/Success');
    }
  }
}
