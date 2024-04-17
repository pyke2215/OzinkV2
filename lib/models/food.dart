import 'package:cloud_firestore/cloud_firestore.dart';

// food item
class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final String category;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
  });

  static Food fromSnapshot(DocumentSnapshot snap) {
    Food food = Food(
        name: snap['name'],
        description: snap['description'],
        price: snap['price'],
        imagePath: snap['imagePath'],
        category: snap['category']);
    return food;
  }
}

// final List<String> foodCategorie = [
//   'burgers',
//   'coffee',
//   'salads',
//   'sides',
//   'desserts',
// ];
