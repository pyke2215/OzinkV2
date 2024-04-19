import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_current_location.dart';
import 'package:fooddelivtute/models/restaurant.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('MyCurrentLocation opens location search box and updates address',
      (WidgetTester tester) async {
    // Create a mock Restaurant instance
    final restaurant = Restaurant();

    // Build the MyCurrentLocation widget with the mock Restaurant instance
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<Restaurant>.value(
          value: restaurant,
          child: MyCurrentLocation(),
        ),
      ),
    );

    // Tap on the MyCurrentLocation widget to open the location search box
    await tester.tap(find.text('Giao hàng ngay'));
    await tester.pump();

    // Verify that the AlertDialog is displayed
    expect(find.byType(AlertDialog), findsOneWidget);

    // Enter a new address in the TextField
    await tester.enterText(find.byType(TextField), '123 Main St');
    await tester.pump();

    // Tap on the save button
    await tester.tap(find.text('Lưu'));
    await tester.pump();

    // Verify that the delivery address is updated
    expect(find.text('123 Main St'), findsOneWidget);
  });
}
