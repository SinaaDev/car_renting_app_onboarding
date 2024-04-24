import 'package:car_renting_app_onboarding/screens/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoButton(
          child: const Text('GO BACK',style: TextStyle(color: Colors.blue,fontSize: 24),),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const OnboardingScreen()));
          },
        ),
      ),
    );
  }
}
