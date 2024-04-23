import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sutdent_provider/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    whereToGo();
    super.initState();
  }

  void whereToGo() async {
    final pref = await SharedPreferences.getInstance();
    var islogged = pref.getBool('isUserLoggedIn');
    Timer(const Duration(seconds: 2), () {
      if (islogged != null && islogged) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  HomePage(),
          )
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  HomePage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Lottie.asset('assets/images/Animation - 1702009582299.json',
            width: 300),
      ),
    );
  }
}
