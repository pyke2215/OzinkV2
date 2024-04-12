import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_drawer_tile.dart'; // Replace with your MyDrawerTile file path

void main() {
  testWidgets('MyDrawerTile UI Test', (WidgetTester tester) async {
    // Define test parameters
    final String tileText = 'Test Tile';
    final IconData tileIcon = Icons.home;
    bool tapped = false;

    // Build the MyDrawerTile widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MyDrawerTile(
            text: tileText,
            icon: tileIcon,
            onTap: () {
              tapped = true;
            },
          ),
        ),
      ),
    );

    // Verify that the ListTile and its content are rendered correctly
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.text(tileText), findsOneWidget);
    expect(find.byIcon(tileIcon), findsOneWidget);

    // Tap on the ListTile
    await tester.tap(find.byType(ListTile));

    // Rebuild the widget after the tap
    await tester.pump();

    // Verify that the onTap function is called
    expect(tapped, true);
  });
}
