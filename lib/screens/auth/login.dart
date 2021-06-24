import 'package:e_wallet_1/providers/auth_providers.dart';
import 'package:e_wallet_1/screens/auth/forgot_password.dart';
import 'package:e_wallet_1/screens/auth/register.dart';
//import 'package:e_wallet_1/screens/home/home.dart';
//import 'package:e_wallet_1/utils/utils.dart';
import 'package:e_wallet_1/widgets/widgets.dart';
import 'package:e_wallet_1/widgets/widgets_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _isloading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _inputEmail() {
    return Container(
        child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _email,
            decoration: InputDecoration(hintText: 'Email'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email tidak boleh kosong';
              }
              return null;
            }));
  }

  Widget _inputPassword() {
    return Stack(children: <Widget>[
      Container(
          child: TextFormField(
              autofocus: true,
              controller: _password,
              obscureText: _obscureText,
              decoration: InputDecoration(hintText: 'Password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              })),
      Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() => _obscureText = !_obscureText);
          },
        ),
      )
    ]);
  }

  Widget _inputforgot() {
    return GestureDetector(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Text('Forgot Password'),
          ),
        ),
        onTap: () => wPushTo(context, ForgotPassword()));
  }

  //Auth Title
  Widget _authTitle() {
    return wAuthTitle(title: 'Login', subtitle: 'Enter Your Email');
  }

  Widget _inputSubmit() {
    return wInputSubmit(
      title: 'Login',
      onPressed: () {
        if (_formKey.currentState!.validate()) return;
        final auth = Provider.of<AuthProvider>(context, listen: false);

        setState(() {
          _isloading = true;
        });

        auth.loginWithEmail(
            context: context, email: _email.text, password: _password.text);
      },
    );
  }

  Widget _googleSigin() {
    return wGoogleSignIn(
      onPressed: () {},
    );
  }

  /// Input Button
  Widget _textRegister() {
    return wTextLink(
      text: 'Dont have on account yet',
      title: 'Register',
      onTap: () => wPusReplaceTo(context, Register()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isloading
          ? wAppLoading()
          : Scaffold(
              // resizeToAvoidBottompadding: false,
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _authTitle(),
                          _inputEmail(),
                          _inputPassword(),
                          _inputforgot(),
                          _inputSubmit(),
                          wTextDivider(),
                          _googleSigin(),
                          _textRegister(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
