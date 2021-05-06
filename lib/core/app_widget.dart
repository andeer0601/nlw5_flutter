import 'package:devquiz/splash/splash_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "devquiz",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}