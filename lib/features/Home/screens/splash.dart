import 'package:flutter/material.dart';
import 'package:openfashon/features/Home/screens/home.dart';

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
      () => Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (c) {
            return Home();
          },
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset("assets/logo/Logo.png", width: 150)),
    );
  }
}
