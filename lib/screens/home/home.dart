import 'package:flutter/material.dart';
import 'package:project_k/model/user_model.dart';
import 'package:project_k/screens/home/todo_list.dart';
import 'package:project_k/services/auth.dart';
import 'package:project_k/screens/authenticate/sign_in.dart';
import 'package:project_k/services/database.dart';
import 'package:project_k/shared/FadeRoute.dart';
import 'package:project_k/model/todo.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  final UserModel curUser;
  Home(this.curUser);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ToDo>>.value(
      catchError: (context, error) {
        print(error);
        return null;
      },
      value: DatabaseService(uid: curUser.uid).todos,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ToDoList(), _signOutButton(context)],
          ),
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
