import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_cart_tile.dart';
import 'package:fooddelivtute/models/cart_item.dart';
import 'package:fooddelivtute/models/food.dart';
import 'package:fooddelivtute/models/restaurant.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('MyCartTile displays correct information', (WidgetTester tester) async {
    // Create a mock cart item
    final cartItem = CartItem(
      food: Food(
        name: 'Cordyceps Tea',
        description: 'Tea make from dry cordyceps',
        imagePath: 'cordyceps_tea.jpg',
        price: 10.0,
        category: 'Healthy Drink',
      ),
      quantity: 2,
    );

    // Build the MyCartTile widget with the mock cart item
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<Restaurant>(
          create: (_) => Restaurant(),
          child: MyCartTile(cartItem: cartItem),
        ),
      ),
    );

    // Verify that the MyCartTile displays the correct food name
    expect(find.text('Pizza'), findsOneWidget);

    // Verify that the MyCartTile displays the correct total price
    expect(find.text('\$20.00'), findsOneWidget);

    // Verify that the MyCartTile displays the correct quantity
    expect(find.text('2'), findsOneWidget);
  });
}
