import 'package:e_wallet_1/providers/auth_providers.dart';
import 'package:e_wallet_1/screens/auth/login.dart';
//import 'package:e_wallet_1/screens/auth/verif_email.dart';
//import 'package:e_wallet_1/screens/home/home.dart';
import 'package:e_wallet_1/widgets/widgets.dart';
import 'package:e_wallet_1/widgets/widgets_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordConf = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isloading = false;

  Widget _inputName() {
    return Container(
      child: TextFormField(
        textCapitalization: TextCapitalization.words,
        controller: _name,
        decoration:
            InputDecoration(hintText: 'Name', helperText: 'Enter Your Name'),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Nama tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  Widget _inputEmail() {
    return Container(
      child: TextFormField(
        controller: _email,
        decoration:
            InputDecoration(hintText: 'Email', helperText: 'Enter Email'),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Email tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  Widget _inputPassword() {
    return Row(children: <Widget>[
      Expanded(
        child: TextFormField(
          controller: _password,
          decoration:
              InputDecoration(hintText: 'Password', helperText: '******'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Password tidak boleh kosong';
            }
            return null;
          },
        ),
      ),
      SizedBox(width: 20),
      Expanded(
        child: TextFormField(
          controller: _passwordConf,
          decoration: InputDecoration(
              hintText: '*****', helperText: 'Confirm Password'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Confrim Password Tidak boleh kosong tidak boleh kosong';
            }
            return null;
          },
        ),
      ),
    ]);
  }

  Widget _authTitle() {
    return wAuthTitle(title: 'Login', subtitle: 'Fill the form to register');
  }

  Widget _inputSubmit() {
    return wInputSubmit(
        title: 'Login',
        onPressed: () {
          if (!_formKey.currentState!.validate()) return;
          setState(() => _isloading = true);
          final auth = Provider.of<AuthProvider>(context, listen: false);
          auth.registerWithEmail(
            context: context,
            name: _name.text,
            email: _email.text,
            password: _password.text,
          );
        });
  }

  Widget _googleSigin() {
    return wGoogleSignIn(
      onPressed: () {},
    );
  }

  /// Input Button
  Widget _textLogin() {
    return wTextLink(
      text: 'Already have on account?',
      title: 'Login',
      onTap: () => wPusReplaceTo(context, Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isloading
          ? wAppLoading()
          : Center(
              child: Scaffold(
                // resizeToAvoidBottompadding: false,
                body: Center(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 20),
                              _authTitle(),
                              _inputName(),
                              _inputEmail(),
                              _inputPassword(),
                              SizedBox(height: 30),
                              _inputSubmit(),
                              wTextDivider(),
                              _googleSigin(),
                              _textLogin(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
