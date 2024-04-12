import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_textfield.dart'; // Replace with your MyTextField file path

void main() {
  testWidgets('MyTextField UI Test', (WidgetTester tester) async {
    // Create a TextEditingController
    final TextEditingController controller = TextEditingController();

    // Build the MyTextField widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MyTextField(
            controller: controller,
            hintText: "Enter your text",
            obscureText: false,
          ),
        ),
      ),
    );

    // Verify that the TextField widget is rendered
    expect(find.byType(TextField), findsOneWidget);

    // Enter text into the TextField
    await tester.enterText(find.byType(TextField), 'Test text');

    // Verify that the text entered matches the input
    expect(controller.text, 'Test text');

    // Verify that the hintText is rendered correctly
    expect(find.text("Enter your text"), findsOneWidget);
  });
}
