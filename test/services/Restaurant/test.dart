import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooddelivtute/models/food.dart';
import 'package:fooddelivtute/models/cart_item.dart';
import 'package:fooddelivtute/models/restaurant.dart';
import 'package:mockito/mockito.dart';

class MockList extends Mock implements List {}

class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

void main() {
  group('Restaurant', () {
    late Restaurant restaurant;

    setUp(() {
      restaurant = Restaurant();
    });

    test('addToCart adds drink to cart', () {
      final drink = Food(
        name: 'moonlight',
        description: 'the cocktail represent for deadth of moon',
        imagePath: 'coffee_image.jpg',
        price: 5.0,
        category: 'Clcoholic Beverage',
      );
      final cartItem = CartItem(food: drink, quantity: 2); // Modify the quantity here
      restaurant.addToCart(drink);
      expect(restaurant.cart.length, equals(1));
      expect(restaurant.cart[0].food, equals(drink));
      expect(restaurant.cart[0].quantity, equals(1)); // Update the expected quantity
    });

    test('removeFromCart removes drink from cart', () {
      final drink = Food(
        name: 'Coffee',
        description: 'Delicious coffee',
        imagePath: 'coffee_image.jpg',
        price: 5.0,
        category: 'Soft Drink',
      );
      final cartItem = CartItem(food: drink, quantity: 3); // Modify the quantity here
      restaurant.addToCart(drink);
      restaurant.addToCart(drink);
      restaurant.addToCart(drink);

      restaurant.removeFromCart(cartItem);

      expect(restaurant.cart.length, equals(2)); // Updated length after removal
      expect(restaurant.cart[0].food, equals(drink));
      expect(restaurant.cart[0].quantity, equals(2)); // Update the expected quantity
    });

    test('getTotalPrice calculates total price of cart', () {
      final drink1 = Food(
        name: 'Coffee',
        description: 'Delicious coffee',
        imagePath: 'coffee_image.jpg',
        price: 5.0,
        category: 'Soft Drink',
      );
      final drink2 = Food(
        name: 'Tea',
        description: 'Refreshing tea',
        imagePath: 'tea_image.jpg',
        price: 3.0,
        category: 'Healthy Drink',
      );
      restaurant.addToCart(drink1);
      restaurant.addToCart(drink2);
      restaurant.addToCart(drink2);

      expect(restaurant.getTotalPrice(), equals(13.0)); // Corrected expected total price
    });
     test('getTotalItemCount calculates total number of items in cart', () {
      final drink1 = Food(
        name: 'Coffee',
        description: 'Delicious coffee',
        imagePath: 'coffee_image.jpg',
        price: 5.0,
        category: 'Soft Drink',
      );
      final drink2 = Food(
        name: 'Tea',
        description: 'Refreshing tea',
        imagePath: 'tea_image.jpg',
        price: 3.0,
        category: 'Healthy Drink',
      );
      restaurant.addToCart(drink1);
      restaurant.addToCart(drink2);
      restaurant.addToCart(drink2);

      expect(restaurant.getTotalItemCount(), equals(3));
    });

    test('clearCart clears all items from the cart', () {
      final drink1 = Food(
        name: 'Coffee',
        description: 'Delicious coffee',
        imagePath: 'coffee_image.jpg',
        price: 5.0,
        category: 'Soft Drink',
      );
      final drink2 = Food(
        name: 'Tea',
        description: 'Refreshing tea',
        imagePath: 'tea_image.jpg',
        price: 3.0,
        category: 'Healthy Drink',
      );
      restaurant.addToCart(drink1);
      restaurant.addToCart(drink2);
      restaurant.addToCart(drink2);

      restaurant.clearCart();

      expect(restaurant.cart.length, equals(0));
    });

    test('updateDeliveryAddress updates the delivery address', () {
      final newAddress = '123 Main St';
      restaurant.updateDeliveryAddress(newAddress);

      expect(restaurant.deliveryAddress, equals(newAddress));
    });

    test('_formatPrice formats the price correctly', () {
      final restaurant = Restaurant();
      final price = 10.5;
      final formattedPrice = restaurant.formatPrice(price);

      expect(formattedPrice, equals('11 VND')); // 10.5 should round up to 11
    });
  });
}
