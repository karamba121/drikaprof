import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drikaprof/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class AuthServiceContract {
  bool get isAuthenticated;
  User? get user;
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password, String name);
  Future<void> signOut();
}

class AuthService implements AuthServiceContract, Disposable {
  late User? _user;
  late StreamSubscription<User?> _userSubscription;

  AuthService() {
    _userSubscription = FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) => _user = user);
  }

  @override
  bool get isAuthenticated => _user != null;

  @override
  Future<void> signUp(String email, String password, String name) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      Map<String, dynamic> data = {
        'name': name,
        'email': email,
        'active': true,
        'type': UserType.student.index,
        'id': credential.user!.uid,
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set(data);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //
      } else if (e.code == 'email-already-in-use') {
        //
      }
    } catch (e) {
      //
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print(e);
      } else if (e.code == 'wrong-password') {
        print(e);
      }
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  User? get user {
    return _user;
  }

  @override
  void dispose() {
    _userSubscription.cancel();
  }
}
