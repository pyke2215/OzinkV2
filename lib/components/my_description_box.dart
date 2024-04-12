import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_description_box.dart'; // Replace with your MyDescriptionBox file path

void main() {
  testWidgets('MyDescriptionBox UI Test', (WidgetTester tester) async {
    // Build the MyDescriptionBox widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MyDescriptionBox(),
      ),
    ));

    // Verify that the primary text style is applied correctly
    expect(find.text("đ1000"), findsOneWidget);
    expect(
      tester.widget<Text>(find.text("đ1000")).style!.color,
      equals(Colors.white),
    );

    // Verify that the secondary text style is applied correctly
    expect(find.text("Phí ship"), findsOneWidget);
    expect(
      tester.widget<Text>(find.text("Phí ship")).style!.color,
      equals(Colors.black),
    );

    // Verify that the primary text style is applied correctly
    expect(find.text("15-30 phút"), findsOneWidget);
    expect(
      tester.widget<Text>(find.text("15-30 phút")).style!.color,
      equals(Colors.white),
    );

    // Verify that the secondary text style is applied correctly
    expect(find.text("Thời gian giao hàng"), findsOneWidget);
    expect(
      tester.widget<Text>(find.text("Thời gian giao hàng")).style!.color,
      equals(Colors.black),
    );
  });
}
