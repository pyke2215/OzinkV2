import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_button.dart'; // Replace with your MyButton file path

void main() {
  testWidgets('MyButton UI Test', (WidgetTester tester) async {
    // Build the MyButton widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MyButton(
          text: "Test Button",
          onTap: () {},
        ),
      ),
    ));

    // Verify that the button text is displayed
    expect(find.text("Test Button"), findsOneWidget);

    // Verify that the button has the correct style
    final textWidget = tester.widget<Text>(find.text("Test Button"));
    expect(textWidget.style?.fontWeight, equals(FontWeight.bold));
    expect(textWidget.style?.color, equals(Colors.white));
    expect(textWidget.style?.fontSize, equals(16.0));

    // Tap on the button
    await tester.tap(find.byType(GestureDetector));

    // Rebuild the widget after the tap
    await tester.pump();

    // Verify that onTap callback is called
    // Add your verification logic here
  });
}
