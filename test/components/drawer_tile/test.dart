import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_drawer_tile.dart';

void main() {
  testWidgets('MyDrawerTile renders correctly', (WidgetTester tester) async {
    // Build the MyDrawerTile widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MyDrawerTile(
            text: 'Test Tile',
            icon: Icons.text_snippet,
            onTap: () {}, // Mock onTap function
          ),
        ),
      ),
    );

    // Verify that the title and icon are rendered correctly
    expect(find.text('Test Tile'), findsOneWidget);
    expect(find.byIcon(Icons.text_snippet), findsOneWidget);

    // Tap on the tile
    await tester.tap(find.text('Test Tile'));
    await tester.pump();
  });
}
