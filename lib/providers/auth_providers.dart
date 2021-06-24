import 'package:e_wallet_1/screens/auth/verif_email.dart';
import 'package:e_wallet_1/screens/home/home.dart';
import 'package:e_wallet_1/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:e_wallet_1/screens/auth/login.dart';

class AuthProvider with ChangeNotifier {
  /// Login With Email dan Password
  void loginWithEmail(
      {required BuildContext context,
      required String email,
      required String password}) async {
    if (email == 'admin@gmail' && password == '123123') {
      await Future.delayed(Duration(seconds: 3));
      wPusReplaceTo(context, Home());
    } else {
      print('GAGAL!');
    }
  }

  ///Reset Password
  void resetPassword(
      {required BuildContext context, required String email}) async {
    if (email.isNotEmpty) {
      print('BERHASIL!');
      await Future.delayed(Duration(seconds: 2));
      wShowToast('Email Sended Please check your email to reset password');
      Navigator.pop(context);
    } else {
      print('GAGAL!');
    }
  }

  ///Regitster with Email
  void registerWithEmail(
      {required BuildContext context,
      required String name,
      required String email,
      required String password}) async {
    print(name);
    print(email);
    print(password);

    await Future.delayed(Duration(seconds: 3));
    wPusReplaceTo(context, Login());

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return VerifEmail();
        });
  }

  ///Resend Email Verification
  Future<void> resendEmailVerif() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
