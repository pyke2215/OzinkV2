import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_drawer_tile.dart';

void main() {
  testWidgets('MyDrawerTile renders correctly', (WidgetTester tester) async {
    // Build the MyDrawerTile widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DrawerTile(
            text: 'Test Tile',
            icon: Icons.test,
            onTap: () {}, // Mock onTap function
          ),
        ),
      ),
    );

    // Verify that the title and icon are rendered correctly
    expect(find.text('Test Tile'), findsOneWidget);
    expect(find.byIcon(Icons.test), findsOneWidget);

    // Tap on the tile
    await tester.tap(find.text('Test Tile'));
    await tester.pump();

    // Verify that the onTap function is called when the tile is tapped
    // You can replace this expectation with your own specific behavior
    // based on what you want the onTap function to do
    // In this example, we just check if the onTap function is called
    // You may want to mock the onTap function and check its behavior
    // using a mock function or a spy
    expect(tapCount, 1); // Assuming tapCount is a global variable incremented in onTap
  });
}
