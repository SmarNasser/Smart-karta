import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/Models/user.dart';

class AuthServices {

  String _userID, _password;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  User _userFromFirebaseUser (FirebaseUser user){
    //return user!=null ? User (uid: user.uid): null ;

  }
  Stream <User> get user {
    return _auth.onAuthStateChanged
        .map(_userFromFirebaseUser);
  }
  Future signIn (String email , String password)async {
    try {
      final login = await _auth.signInWithEmailAndPassword(
          email: _userID, password: _password);

      FirebaseUser user = login.user;
      return _userFromFirebaseUser(user);
    }
    catch (e)
    {
      print(e.toString());
      return null;
    }
  }
}