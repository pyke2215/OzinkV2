import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/models/restaurant.dart';
import 'package:fooddelivtute/components/my_current_location.dart'; // Update with the correct import path
import 'package:provider/provider.dart';

void main() {
  testWidgets('MyCurrentLocation UI Test', (WidgetTester tester) async {
    // Create a mock Restaurant instance
    final mockRestaurant = Restaurant();

    // Build the MyCurrentLocation widget wrapped in a Provider
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: mockRestaurant),
        ],
        child: MaterialApp(
          home: Scaffold(
            body: MyCurrentLocation(),
          ),
        ),
      ),
    );

    // Verify that the "Giao hàng ngay" text is displayed
    expect(find.text("Giao hàng ngay"), findsOneWidget);

    // Tap on the location text to open the location search box
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // Verify that the alert dialog is displayed
    expect(find.byType(AlertDialog), findsOneWidget);

    // Verify that the cancel button is displayed
    expect(find.text('Hủy'), findsOneWidget);

    // Tap on the cancel button
    await tester.tap(find.text('Hủy'));
    await tester.pump();

    // Verify that the alert dialog is dismissed
    expect(find.byType(AlertDialog), findsNothing);

    // Tap on the location text again
    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // Tap on the save button
    await tester.tap(find.text('Lưu'));
    await tester.pump();

    // Verify that the updateDeliveryAddress function is called with the new address
    expect(mockRestaurant.deliveryAddress, isNotNull);
  });
}
