import 'package:e_wallet_1/providers/auth_providers.dart';
import 'package:e_wallet_1/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
      ),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Splash());
  }
}
