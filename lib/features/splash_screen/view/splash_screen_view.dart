import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  static const String routeName = "/splashscreen";
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
