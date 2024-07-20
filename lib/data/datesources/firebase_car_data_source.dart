import 'package:car_rental_app/data/models/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDataSource {
  final FirebaseFirestore firestore;

  FirebaseCarDataSource({required this.firestore});

  Future<List<Car>> getCars() async {
    final snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc) => Car.fromDocument(doc.data())).toList();
  }
}
