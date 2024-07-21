import 'package:cloud_firestore/cloud_firestore.dart';

class PackageModel{
  String name;
  int price;

  PackageModel({required this.name, required this.price });

  factory PackageModel.fromFirestore(
    DocumentSnapshot doc
  ){
    Map data = doc.data() as Map<String, dynamic>;
    return PackageModel(
      name: data['name'],
      price: data['price']
    );
  }

  Stream<PackageModel> getPackage(String id){
    return FirebaseFirestore.instance.collection('packages').doc(id).snapshots().map((doc) => PackageModel.fromFirestore(doc));
  }

  //list from firestore
  static List<PackageModel> fromFirestoreList(QuerySnapshot snapshot){
    return snapshot.docs.map((doc) {
      return PackageModel.fromFirestore(doc);
    }).toList();
  }
}