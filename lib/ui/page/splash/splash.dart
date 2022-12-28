import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guettoolbox/data/repository/login.dart';
import 'package:guettoolbox/ui/route.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? t;

  // and later, before the timer goes off...

  @override
  void dispose() {
    super.dispose();
    t?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration:
          BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      child: Center(child: Image(image: AssetImage("images/logo.png"))),
    );
  }

  @override
  void initState() {
    super.initState();
    t = Timer(Duration(milliseconds: 500), () {
      LoginRepository().ticket.then((ticket) {
        var route = true ? AppRoute.loginPage : AppRoute.mainPage;
        Navigator.pushReplacementNamed(context, route);
      });
    });
  }
}
