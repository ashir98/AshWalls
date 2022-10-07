import 'dart:async';

import 'package:ash_walls/Screens/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final isSwitched;
  const Splash({super.key, required this.isSwitched});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(isSwitched: widget.isSwitched))) );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color:Colors.white,
      child: Image.asset("images/splash.gif"),
    );
  }
}