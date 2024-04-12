import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_cart_tile.dart'; // Replace with your MyCartTile file path
import 'package:fooddelivtute/models/cart_item.dart';
import 'package:fooddelivtute/models/food.dart'; // Import the Food class
import 'package:fooddelivtute/components/my_quantity_selector.dart';
void main() {
  testWidgets('MyCartTile UI Test', (WidgetTester tester) async {
    // Create a CartItem for testing
    final cartItem = CartItem(
      food: Food(
        name: "Test Food",
        description: "Test Description",
        imagePath: "assets/test_food.png",
        price: 10.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Test Addon 1", price: 2.99),
          Addon(name: "Test Addon 2", price: 1.99),
        ],
      ),
      quantity: 2,
      selectedAddons: [
        Addon(name: "Test Addon 1", price: 2.99),
        Addon(name: "Test Addon 2", price: 1.99),
      ],
    );

    // Build the MyCartTile widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MyCartTile(cartItem: cartItem),
      ),
    ));

    // Verify that the food name is displayed
    expect(find.text("Test Food"), findsOneWidget);

    // Verify that the food description is displayed
    expect(find.text("Test Description"), findsOneWidget);

    // Verify that the food price is displayed
    expect(find.text("\$10.99"), findsOneWidget);

    // Verify that the quantity selector is displayed
    expect(find.byType(QuantitySelector), findsOneWidget);

    // Tap on the increment button of the quantity selector
    await tester.tap(find.byKey(Key("increment_button")));

    // Verify that the quantity is updated
    expect(find.text("3"), findsOneWidget);

    // Tap on the decrement button of the quantity selector
    await tester.tap(find.byKey(Key("decrement_button")));

    // Verify that the quantity is updated
    expect(find.text("2"), findsOneWidget);

    // Verify that the addons are displayed
    expect(find.text("Test Addon 1"), findsOneWidget);
    expect(find.text("\$2.99"), findsOneWidget);
    expect(find.text("Test Addon 2"), findsOneWidget);
    expect(find.text("\$1.99"), findsOneWidget);
  });
}
