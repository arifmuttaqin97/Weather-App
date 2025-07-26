import 'package:flutter/material.dart';
import 'package:weather_app/ui/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/cloud.png', width: 100),
                  SizedBox(width: 20),
                  Text('Weather App', style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(height: 80),
              TextFormField(decoration: InputDecoration(hintText: 'Username')),
              TextFormField(decoration: InputDecoration(hintText: 'Password')),
              SizedBox(height: 80),
              GestureDetector(
                onTap:
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (builder) => HomePage())),
                child: Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
