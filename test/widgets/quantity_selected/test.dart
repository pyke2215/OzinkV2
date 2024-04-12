import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/models/food.dart';
import 'package:fooddelivtute/components/my_quantity_selector.dart'; // Update with the correct import path

void main() {
  testWidgets('QuantitySelector UI Test', (WidgetTester tester) async {
    // Define mock quantity, food, and callbacks
    const mockQuantity = 2;
    final mockFood = Food(
      name: 'Test Food',
      description: 'Test Description',
      imagePath: 'assets/test_image.jpg',
      price: 10.0,
      category: FoodCategory.burgers,
      availableAddons: [],
    );
    bool incrementPressed = false;
    bool decrementPressed = false;
    void mockIncrement() {
      incrementPressed = true;
    }
    void mockDecrement() {
      decrementPressed = true;
    }

    // Build the QuantitySelector widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QuantitySelector(
            quantity: mockQuantity,
            food: mockFood,
            onIncrement: mockIncrement,
            onDecrement: mockDecrement,
          ),
        ),
      ),
    );

    // Verify the initial quantity is displayed correctly
    expect(find.text(mockQuantity.toString()), findsOneWidget);

    // Tap on the increment button and verify the callback is triggered
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(incrementPressed, true);

    // Tap on the decrement button and verify the callback is triggered
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(decrementPressed, true);
  });
}
