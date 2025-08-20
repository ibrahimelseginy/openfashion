import 'package:flutter/material.dart';
import 'package:openfashon/features/components/app_routers.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, AppRoutes.home),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset("assets/logo/Logo.png", width: 150)),
    );
  }
}