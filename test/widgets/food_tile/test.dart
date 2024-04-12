import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/models/food.dart';
import 'package:fooddelivtute/components/my_food_tile.dart'; // Update with the correct import path

void main() {
  testWidgets('FoodTile UI Test', (WidgetTester tester) async {
    // Create a mock Food instance
    final mockFood = Food(
      name: 'Test Food',
      description: 'Test Description',
      imagePath: 'assets/test_image.jpg',
      price: 10.0,
      category: FoodCategory.burgers,
      availableAddons: [],
    );

    // Define a mock onTap function
    void mockOnTap() {}

    // Build the FoodTile widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FoodTile(
            food: mockFood,
            onTap: mockOnTap,
          ),
        ),
      ),
    );

    // Verify that the food details are displayed correctly
    expect(find.text(mockFood.name), findsOneWidget);
    expect(find.text('\$${mockFood.price}'), findsOneWidget);
    expect(find.text(mockFood.description), findsOneWidget);

    // Verify that the food image is displayed
    expect(find.byType(Image), findsOneWidget);

    // Verify that the divider line is displayed
    expect(find.byType(Divider), findsOneWidget);
  });
}
