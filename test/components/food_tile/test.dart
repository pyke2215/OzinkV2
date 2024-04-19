import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_food_tile.dart';
import 'package:fooddelivtute/models/food.dart';

void main() {
  testWidgets('FoodTile renders correctly', (WidgetTester tester) async {
    // Create a mock food item
    final food = Food(
      name: 'Test Drink',
      price: 10.0,
      description: 'Test description',
      imagePath: 'https://example.com/image.jpg',
      category: "Healthy Drink"
    );

    // Define a flag variable to check if onTap is called
    bool onTapCalled = false;

    // Build the FoodTile widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FoodTile(
            food: food,
            onTap: () {
              onTapCalled = true;
            },
          ),
        ),
      ),
    );

    // Verify that the food details are rendered correctly
    expect(find.text('Test Food'), findsOneWidget);
    expect(find.text('\$10.0'), findsOneWidget);
    expect(find.text('Test description'), findsOneWidget);

    // Verify that the food image is rendered
    expect(find.byType(Image), findsOneWidget);

    // Tap on the FoodTile
    await tester.tap(find.byType(FoodTile));
    await tester.pump();

    // Verify that the onTap function is called
    expect(onTapCalled, true);
  });
}
