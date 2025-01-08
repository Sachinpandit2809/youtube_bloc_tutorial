import 'package:flutter/material.dart';
import 'package:youtube_bloc_tutorial/config/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.homeScreen);
            },
            child: Text('Splash Screen')),
      ),
    );
  }
}
