import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddelivtute/models/drinks.dart';
Future<List<Drinks>> fetchData() async {
    List<Drinks> drinksData = [];
    QuerySnapshot<Map<String, dynamic>> collections = await FirebaseFirestore.instance.collection("food").get();
    collections.docs.forEach((doc) {
      // Access the document data using the data() method
      Map<String, dynamic> data = doc.data();
      Drinks drinks = Drinks.fromJson(data);
      drinksData.add(drinks);
    });
    return drinksData;
} 