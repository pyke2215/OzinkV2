import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/models/restaurant.dart';
import 'package:fooddelivtute/components/my_receipt.dart'; // Update with the correct import path
import 'package:provider/provider.dart';

void main() {
  testWidgets('MyReceipt UI Test', (WidgetTester tester) async {
    // Provide a mock Restaurant model
    final restaurant = Restaurant();

    // Build the MyReceipt widget wrapped in a Provider
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChangeNotifierProvider<Restaurant>.value(
            value: restaurant,
            child: MyReceipt(),
          ),
        ),
      ),
    );

    // Verify that the "Cảm ơn bạn vì đặt hàng" text is displayed
    expect(find.text("Cảm ơn bạn vì đặt hàng"), findsOneWidget);

    // Verify that the receipt container is displayed
    expect(find.byType(Container), findsOneWidget);

    // Verify that the "Thời gian giao hàng dự kiến: 15 phút" text is displayed
    expect(find.text("Thời gian giao hàng dự kiến: 15 phút"), findsOneWidget);

    // Verify that the receipt text is updated with the correct value
    expect(find.text(restaurant.displayCartReceipt()), findsOneWidget);
  });
}
