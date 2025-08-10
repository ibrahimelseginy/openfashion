import 'package:flutter/material.dart';
import 'package:openfashon/features/Home/screens/splash.dart';

void main() {
  runApp(const openFashon());
}

class openFashon extends StatelessWidget {
  const openFashon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Splash(),
    );
  }
}
