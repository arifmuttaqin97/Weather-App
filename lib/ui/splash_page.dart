import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/ui/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    startSplashScreen();
    super.initState();
  }

  startSplashScreen() async {
    return Timer(Duration(seconds: 5), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (builder) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Center(child: Image.asset('assets/cloud.png', width: 200)),
              Text('Weather App', style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
