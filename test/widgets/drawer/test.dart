import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/services/auth/auth_service.dart';
import 'package:fooddelivtute/components/my_drawer.dart'; // Update with the correct import path
import 'package:mockito/mockito.dart';

// Mock AuthService class
class MockAuthService extends Mock implements AuthService {}

void main() {
  testWidgets('MyDrawer UI Test', (WidgetTester tester) async {
    // Create a mock AuthService instance
    final mockAuthService = MockAuthService();

    // Build the MyDrawer widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          drawer: MyDrawer(),
        ),
      ),
    );

    // Verify that the app logo icon is displayed
    expect(find.byIcon(Icons.lock_open_rounded), findsOneWidget);

    // Verify that the home list tile is displayed
    expect(find.text("Trang Chủ"), findsOneWidget);

    // Verify that the setting list tile is displayed
    expect(find.text("Cài Đặt"), findsOneWidget);

    // Verify that the logout list tile is displayed
    expect(find.text("Đăng Xuất"), findsOneWidget);

    // Tap on the logout list tile
    await tester.tap(find.text("Đăng Xuất"));
    await tester.pump();

    // Verify that the logout function is called when the logout list tile is tapped
    verify(mockAuthService.signOut()).called(1);
  });
}
