

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String firstname;
  String lastname;
  String email;
  String country;
  String accountType;
  String uid;
  bool enrolled;
  DateTime dateOfBirth;

  UserModel(
      {required this.firstname, required this.email, required this.lastname
      , required this.country, required this.dateOfBirth,
      required this.accountType, required this.uid, this.enrolled = false});
  
  //from firestore
  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return UserModel(
      firstname: data['firstname'],
      lastname: data['lastname'],
      email: data['email'],
      country: data['country'],
      accountType: data['accountType'],
      uid: data['uid'],
      enrolled: data['enrolled'],
      dateOfBirth: DateTime.parse(data['dateOfBirth']),
    );
  }
  
  //to firestore
  Map<String, dynamic> toFirestore() => {
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'country': country,
        'accountType': accountType,
        'uid': uid,
        'enrolled': enrolled,
        'dateOfBirth': dateOfBirth.toString(),
      };
}
