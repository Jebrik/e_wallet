import 'package:e_wallet_1/providers/auth_providers.dart';
import 'package:e_wallet_1/widgets/widgets.dart';
import 'package:e_wallet_1/widgets/widgets_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _email = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Widget _inputEmail() {
    return Container(
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration:
            InputDecoration(hintText: 'Email', helperText: 'Enter Your  Email'),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
      title: 'Send',
      onPressed: () {
        if (!_formKey.currentState!.validate()) return;
        final auth = Provider.of<AuthProvider>(context, listen: false);

        setState(() {
          _isLoading = true;
        });

        auth.resetPassword(context: context, email: _email.text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading()
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      wAuthTitle(
                          title: 'Forgot Password',
                          subtitle:
                              'Enter Your Email and we\'ll send you a link into reset your password'),
                      _inputEmail(),
                      SizedBox(
                        height: 30,
                      ),
                      _inputSubmit()
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
