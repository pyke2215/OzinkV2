import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/pages/login_page.dart'; // Replace with your LoginPage file path

void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    // Build the LoginPage widget
    await tester.pumpWidget(MaterialApp(home: LoginPage(onTap: () {})));

    // Verify that the logo is displayed
    expect(find.byIcon(Icons.lock_open_rounded), findsOneWidget);

    // Verify that the slogan text is displayed
    expect(find.text("App Đặt Đồ Uống"), findsOneWidget);

    // Verify that the email text field is displayed
    expect(find.byKey(Key("emailTextField")), findsOneWidget);

    // Verify that the password text field is displayed
    expect(find.byKey(Key("passwordTextField")), findsOneWidget);

    // Verify that the login button is displayed
    expect(find.byKey(Key("loginButton")), findsOneWidget);

    // Verify that the "Chưa có tài khoản?" text is displayed
    expect(find.text("Chưa có tài khoản?"), findsOneWidget);

    // Verify that the "Đăng kí ngay" text is displayed
    expect(find.text("Đăng kí ngay"), findsOneWidget);
  });

  testWidgets('LoginPage onTap Test', (WidgetTester tester) async {
    bool onTapCalled = false;
    void handleTap() {
      onTapCalled = true;
    }

    // Build the LoginPage widget
    await tester.pumpWidget(MaterialApp(home: LoginPage(onTap: handleTap)));

    // Tap on the "Đăng kí ngay" text
    await tester.tap(find.text("Đăng kí ngay"));

    // Rebuild the widget after the tap
    await tester.pump();

    // Verify that onTap callback is called
    expect(onTapCalled, isTrue);
  });
}
