import 'package:e_wallet_1/screens/auth/login.dart';
import 'package:e_wallet_1/screens/home/home.dart';
import 'package:e_wallet_1/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    _checkUserSementara(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: wAppLoading());
  }

  void _checkUserSementara(bool user) async {
    await Future.delayed(Duration(seconds: 2));
    wPusReplaceTo(context, user ? Home() : Login());
  }
}
