import 'dart:async';

import 'package:flutter/material.dart';

import '../../route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration:
      BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      child: Center(child: Image(image: AssetImage("assets/images/logo.png"))),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500),(){
      Navigator.pushReplacementNamed(context, AppRoute.mainPage,
          arguments: false);
    });
  }
}
