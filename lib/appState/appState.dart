// ignore_for_file: file_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relearner/models/courses_model.dart';
import 'package:relearner/models/user_model.dart';
import 'package:relearner/modules/general_modules.dart';

class AppState extends ChangeNotifier {
  User? currentUser;
  UserModel? userModel;
  List<CourseModel>? courses;
  CourseModel? course;

  bool _isDark = false;
  bool get isDark => _isDark;

  void initializeApp() {
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

  void logoutSequence(BuildContext context) {
    FirebaseAuth.instance.signOut();
    currentUser = null;
    userModel = null;
    Navigator.pushReplacementNamed(context, '/login');
    notifyListeners();
  }

  Future<void> loginSequence(
      String email, String password, BuildContext context) async {
    try {
      //show message to user
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
      //log user in and retrieve credentials
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      setUser(userCredential.user);
      await getUserModelFromFirestore(userCredential.user!.uid);
      //go to home page
      Navigator.pushReplacementNamed(context, '/home');
      //exceptional(as always) exception handling below
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackBarMessage("No user for that email", context);
      } else if (e.code == 'wrong-password') {
         snackBarMessage("Wrong password provided", context);
      }
    }
    on Exception catch (e) {
      snackBarMessage("An error ocurred, try again", context);
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

  Future<void> registerSequence(
    BuildContext context,
    String email,
    String password,
    String country,
    String firstname,
    String lastname,
    String accountType,
    DateTime dob,
  ) async {
    try {
      //message to user
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Row(
        children: [
          Text(
            'Creating your account',
            style: defaultTextStyle,
          ),
          Spacer(),
          CircularProgressIndicator()
        ],
      )));

      //sign in user and store credentials
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      setUser(FirebaseAuth.instance.currentUser);
      var userModel = UserModel(
          firstname: firstname,
          email: email,
          lastname: lastname,
          country: country,
          dateOfBirth: dob,
          accountType: accountType,
          uid: currentUser!.uid);
      await updateUserModel(userModel);

      //go to home page
      Navigator.pushReplacementNamed(context, "/home");
      //below is exceptional exception handling
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
           snackBarMessage("Email already used", context);

        case "invalid-email":
           snackBarMessage("Invalid Email", context);        
        default:
          snackBarMessage("An error ocurred, try again", context);
      }
    }
  }

  snackBarMessage(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }

  void setCurrentCourse(CourseModel course) {
    this.course = course;
    notifyListeners();
  }

  void setCourses(List<CourseModel> courses) {
    this.courses = courses;
    notifyListeners();
  }

  Future<List<CourseModel>> getCourses()async{
    var db = FirebaseFirestore.instance;
    final ref = db.collection('Module');
    var data = await ref.get() ;
    courses = CourseModel.fromFirestoreList(data);
    notifyListeners();
    return courses!;
  }
}
