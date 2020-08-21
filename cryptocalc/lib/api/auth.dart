import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///
  /// return the Future with firebase user object FirebaseUser if one exists (IN USE)
  ///
  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }


  // wrapping the firebase calls (IN USE)
  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    notifyListeners();
    return result;
  }

  // wrapping the firebase calls
  Future createUser(
      {String firstName,
      String lastName,
      String email,
      String password}) async {

    var r = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    var u = r;
    
    UserUpdateInfo info = UserUpdateInfo();
    info.displayName = '$firstName $lastName';
    await u.updateProfile(info);
    var f = await getUser();
    return f;
  }

  // Updating Created user
  Future updateProfileCreated(
    String userName,
    String avatarURL
  ) async {
    var message;
    UserUpdateInfo info = UserUpdateInfo();
    info.displayName = '$userName';
    info.photoUrl = avatarURL;

    FirebaseUser firebaseUser = await _auth.currentUser();
      firebaseUser
          .updateProfile(info)
          .then(
            (value) => message = 'Success',
          )
          .catchError((onError) => message = 'error');
      return message;
  }

  ///
  /// wrapping the firebase call to signInWithEmailAndPassword (IN USE)
  /// `email` String
  /// `password` String
  ///
  Future<FirebaseUser> loginUser({String email, String password}) async { 
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // since something changed, let's notify the listeners...
      notifyListeners();
      return result;
    }  catch (e) {
      throw new AuthException(e.code, e.message);
    }
  }
}
