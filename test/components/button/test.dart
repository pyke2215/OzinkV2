import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:fooddelivtute/components/my_button.dart';

class MockFunction extends Mock {
  void call();
}

void main() {
  group('MyButton', () {
    testWidgets('Widget renders correctly', (WidgetTester tester) async {
      // Build the MyButton widget
      await tester.pumpWidget(MaterialApp(
        home: MyButton(
          text: 'Button Text',
          onTap: () {}, // Provide an empty onTap function for testing
        ),
      ));

      // Verify that the MyButton widget is rendered
      expect(find.byType(MyButton), findsOneWidget);

      // Verify that the text is rendered
      expect(find.text('Button Text'), findsOneWidget);
    });

    testWidgets('onTap function is called when button is tapped',
        (WidgetTester tester) async {
      // Create a mock onTap function
      final mockOnTap = MockFunction();

      // Build the MyButton widget with the mock onTap function
      await tester.pumpWidget(MaterialApp(
        home: MyButton(
          text: 'Button Text',
          onTap: mockOnTap.call,
        ),
      ));

      // Tap the MyButton widget
      await tester.tap(find.byType(MyButton));

      // Verify that the onTap function is called once
      verify(mockOnTap.call()).called(1);
    });
  });
}
