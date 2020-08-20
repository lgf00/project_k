import 'package:flutter/material.dart';
import 'package:project_k/screens/authenticate/auth.dart';
import 'package:project_k/screens/authenticate/sign_in.dart';
import 'package:project_k/shared/FadeRoute.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(displayName),
            // Text(email),
            // Text(uid),
            _signOutButton(context)
          ],
        ),
      ),
    );
  }

  Widget _signOutButton(context) {
    return RaisedButton(
      onPressed: () async {
        await _auth.signOutGoogle();
        Navigator.of(context).pushAndRemoveUntil(
            FadeRoute(page: SignIn()), ModalRoute.withName('/'));
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
                'Sign Out',
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
