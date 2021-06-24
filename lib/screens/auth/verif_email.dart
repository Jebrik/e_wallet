import 'package:e_wallet_1/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifEmail extends StatefulWidget {
  @override
  _VerifEmailState createState() => _VerifEmailState();
}

class _VerifEmailState extends State<VerifEmail> {
  bool _isLoading = false;
  bool _isSended = false;

  Widget _resendEmailButton() {
    return Column(
      children: <Widget>[
        Text('Didnt receive on email ?'),
        TextButton(
          child: Text(_isLoading ? 'sending...' : 'Resend'),
          onPressed: () async {
            setState(() => _isLoading = true);

            final auth = Provider.of<AuthProvider>(context, listen: false);
            await auth.resendEmailVerif();

            setState(() {
              _isLoading = false;
              _isSended = true;
            });
          },
        )
      ],
    );
  }

  Widget _resendEmailMsg() {
    return Container(
      child: Text(
        'Email Sended!',
        style: TextStyle(color: Colors.green),
      ),
    );
  }

  Widget _buttonWidget() {
    return _isSended ? _resendEmailMsg() : _resendEmailButton();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 1.2,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius:
              BorderRadiusDirectional.vertical(top: Radius.circular(20)),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              child: Icon(Icons.drag_handle),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.alternate_email, size: 50),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Verify Your Email',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                      'We Have Send on email with a confirmation link\n to your email adress,',
                      textAlign: TextAlign.center),
                  SizedBox(height: 30),
                  Divider(height: 40, indent: 50, endIndent: 50),
                  Text(
                    'Please Click on the text to verify your email\n and continue the registration proses',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  Divider(height: 40, indent: 50, endIndent: 50),
                  _buttonWidget()
                ],
              ),
            )
          ],
        ));
  }
}
