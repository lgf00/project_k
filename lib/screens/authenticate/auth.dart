import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_k/model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  UserModel _userFromFirebaseUser(User user) {
    return user != null
        ? UserModel(
            uid: user.uid, displayName: user.displayName, email: user.email)
        : null;
  }

  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User user = authResult.user;
      // assert(user.displayName != null);
      // assert(user.email != null);
      // assert(user.uid != null);
      // assert(!user.isAnonymous);
      // assert(await user.getIdToken() != null);

      // displayName = user.displayName;
      // email = user.email;
      // uid = user.uid;

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOutGoogle() async {
    try {
      return await googleSignIn.signOut();
    } catch (e) {
      return null;
    }
  }
}
