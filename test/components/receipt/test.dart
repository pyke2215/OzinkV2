import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/models/restaurant.dart';
import 'package:fooddelivtute/components/my_receipt.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('MyReceipt renders correctly', (WidgetTester tester) async {
    // Create a mock Restaurant object
    final restaurant = Restaurant();

    // Build the MyReceipt widget with the mock Restaurant object
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<Restaurant>.value(
          value: restaurant,
          child: const MyReceipt(),
        ),
      ),
    );

    // Verify that the text "Cảm ơn bạn vì đặt hàng" is rendered
    expect(find.text("Cảm ơn bạn vì đặt hàng"), findsOneWidget);

    // Verify that the receipt container is rendered
    expect(find.byType(Container), findsNWidgets(2)); // One container for text and one for the receipt

    // Verify that the text "Thời gian giao hàng dự kiến: 15 phút" is rendered
    expect(find.text("Thời gian giao hàng dự kiến: 15 phút"), findsOneWidget);
  });
}
