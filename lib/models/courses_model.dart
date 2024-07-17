import 'package:cloud_firestore/cloud_firestore.dart';

class CourseModel{
  String name;
  String description;

  CourseModel({required this.name, required this.description});

  //from firestore
  factory CourseModel.fromFirestore(DocumentSnapshot doc){
    Map data = doc.data() as Map<String, dynamic>;
    return CourseModel(
      name: data['name'],
      description: data['description']
    );
  }

  //list of courses from firestore
  static List<CourseModel> fromFirestoreList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return CourseModel.fromFirestore(doc);
    }).toList();
  }

  
}