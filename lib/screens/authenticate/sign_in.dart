import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_k/screens/authenticate/auth.dart';
import 'package:project_k/screens/home/home.dart';
import 'package:project_k/shared/FadeRoute.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("assets/elmo_fire.png"),
                height: 200,
              ),
              SizedBox(height: 20),
              _signInButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return RaisedButton(
      onPressed: () async {
        dynamic result = await _auth.signInWithGoogle();
        if (result != null) {
          Navigator.of(context).pushReplacement(FadeRoute(page: Home()));
        } else {
          print('sign in failed');
        }
      },
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 22.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
