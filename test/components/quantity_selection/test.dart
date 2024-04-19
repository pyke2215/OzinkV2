import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_quantity_selector.dart';
import 'package:fooddelivtute/models/food.dart';

void main() {
  testWidgets('QuantitySelector renders correctly', (WidgetTester tester) async {
    // Define initial quantity
    int quantity = 1;

    // Define a flag variable to check if onIncrement and onDecrement are called
    bool incrementCalled = false;
    bool decrementCalled = false;

    // Build the QuantitySelector widget
    await tester.pumpWidget(
      MaterialApp(
        home: QuantitySelector(
          quantity: quantity,
          food: Food(name: 'Test Food', price: 10.0, description: 'test food', imagePath: 'noImg', category: "Soft Drink"),
          onIncrement: () {
            incrementCalled = true;
          },
          onDecrement: () {
            decrementCalled = true;
          },
        ),
      ),
    );

    // Verify that the initial quantity is rendered correctly
    expect(find.text('1'), findsOneWidget);

    // Tap on the increment button
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that onIncrement is called and quantity is updated
    expect(incrementCalled, true);
    expect(quantity, 2);

    // Tap on the decrement button
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // Verify that onDecrement is called and quantity is updated
    expect(decrementCalled, true);
    expect(quantity, 1);
  });
}
