import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_textfield.dart';

void main() {
  testWidgets('MyTextField widget test', (WidgetTester tester) async {
    // Create a TextEditingController
    final TextEditingController controller = TextEditingController();

    // Build MyTextField widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MyTextField(
          controller: controller,
          hintText: 'Enter text',
          obscureText: true,
        ),
      ),
    ));

    // Verify if the MyTextField widget is rendered
    expect(find.byType(MyTextField), findsOneWidget);

    // Verify if the TextField widget is rendered
    expect(find.byType(TextField), findsOneWidget);

    // Verify if the controller is correctly set
    MyTextField textField = tester.widget(find.byType(MyTextField));
    expect(textField.controller, controller);

    // Verify if the obscureText property is correctly set
    TextField textFieldWidget = tester.widget(find.byType(TextField));
    expect(textFieldWidget.obscureText, true);

    // Verify if the hintText is correctly set
    expect(find.text('Enter text'), findsOneWidget);
  });
}
