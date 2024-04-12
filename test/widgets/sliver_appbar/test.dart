import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/pages/cart_page.dart';
import 'package:fooddelivtute/components/my_sliver_app_bar.dart'; // Update with the correct import path

void main() {
  testWidgets('MySliverAppBar UI Test', (WidgetTester tester) async {
    // Build the MySliverAppBar widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              MySliverAppBar(
                child: Placeholder(), // Replace Placeholder with your desired child widget
                title: Text('Title'), // Replace Text('Title') with your desired title widget
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 600, // Adjust the height as needed
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Verify that the SliverAppBar and its child widget are rendered correctly
    expect(find.byType(SliverAppBar), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);

    // Tap on the cart icon button
    await tester.tap(find.byType(IconButton));

    // Wait for navigation to complete
    await tester.pumpAndSettle();

    // Verify that navigation to the CartPage occurs
    expect(find.byType(CartPage), findsOneWidget);
  });
}
