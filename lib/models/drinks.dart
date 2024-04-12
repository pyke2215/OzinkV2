class Drinks {
  String? name;
  double? price;
  String? imgUrl;
  String? description;
  DrinksCategory? category;

  Drinks({
    this.name,
    this.price,
    this.imgUrl,
    this.description,
    this.category,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imgUrl': imgUrl,
      'description': description,
      'category': category?.toString().split('.').last, // Convert enum to string
    };
  }

  // Create Drinks object from JSON data
  factory Drinks.fromJson(Map<String, dynamic> json) {
    return Drinks(
      name: json['name'],
      price: json['price'],
      imgUrl: json['imgUrl'],
      description: json['description'],
      category: json['category'] != null
          ? _parseCategory(json['category'])
          : null,
    );
  }

  // Helper method to parse DrinksCategory from string
  static DrinksCategory? _parseCategory(String? categoryString) {
    if (categoryString == null) return null;
    return DrinksCategory.values.firstWhere(
        (category) => category.toString().split('.').last == categoryString,
        orElse: () => DrinksCategory.unknown);
  }
}

enum DrinksCategory {
  coffee,
  cocktails,
  smoothie,
  tea,
  unknown
}