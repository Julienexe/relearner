// ignore_for_file: file_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:relearner/models/user_model.dart';
import 'package:relearner/modules/general_modules.dart';

class AppState extends ChangeNotifier {
  User? currentUser;
  UserModel? userModel;

  bool _isDark = false;
  bool get isDark => _isDark;

  void initializeApp(){
    setUser(FirebaseAuth.instance.currentUser);
    notifyListeners();
  }

  void updateTheme(bool isDark) {
    _isDark = isDark;
    notifyListeners();
  }

  void setUser(User? user) {
    currentUser = user;
    notifyListeners();
  }

  Future<void> getUserModelFromFirestore(String uid) async {
    var db = FirebaseFirestore.instance;
    final ref = db.collection('Users').doc(uid).withConverter<UserModel>(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (userModel, _) => userModel.toFirestore(),
        );

    final snapshot = await ref.get();
    if (snapshot.exists) {
      userModel = snapshot.data();
      notifyListeners();
    } else {
      userModel = null;
    }
  }

  void logoutSequence(BuildContext context){
    FirebaseAuth.instance.signOut();
    currentUser = null;
    userModel = null;
    Navigator.pushReplacementNamed(context, '/login');
    notifyListeners();
  }

  Future<void> loginSequence(
      String email, String password, BuildContext context) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Row(
        children: [
          Text(
            'Logging you in',
            style: defaultTextStyle,
          ),
          Spacer(),
          CircularProgressIndicator()
        ],
      )));
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      setUser(userCredential.user);
      await getUserModelFromFirestore(userCredential.user!.uid);
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
      }
    }
  }

  Future<void> updateUserModel(UserModel user) async {
    var db = FirebaseFirestore.instance;
    final ref = db.collection('users').doc(user.uid).withConverter<UserModel>(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (userModel, _) => userModel.toFirestore(),
        );

    await ref.set(user);
    userModel = user;
    notifyListeners();
  }
}
