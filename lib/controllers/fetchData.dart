// ignore: fetchData
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddelivtute/models/food.dart';

List<String> menuTabBar = [];
List<Food> menuFood = [];
Future fetchMenuTabBar() async {
  // Phương thức để fetch dữ liệu từ Firestore và cập nhật menuTabBar
  final QuerySnapshot querySnapshotTabBar =
      await FirebaseFirestore.instance.collection('categories').get();
  menuTabBar =
      querySnapshotTabBar.docs.map((doc) => doc['name'] as String).toList();
}

Future fetchMenuData() async {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
  menuFood = querySnapshot.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Food(
      name: data['name'],
      description: data['description'],
      price: data['price'],
      imagePath: data['imagePath'],
      category: data['category'],
    );
  }).toList();
}
