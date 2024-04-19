import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:fooddelivtute/components/my_drawer.dart';
import 'package:fooddelivtute/pages/home_page.dart';
import 'package:fooddelivtute/services/database/firestore.dart';
import 'package:fooddelivtute/pages/settings_page.dart';
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('MyDrawer renders correctly', (WidgetTester tester) async {
    final mockNavigatorObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          drawer: MyDrawer(),
        ),
        navigatorObservers: [mockNavigatorObserver],
      ),
    );

    // Verify that the app logo, list tiles, and logout tile are rendered
    expect(find.byIcon(Icons.lock_open_rounded), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
    expect(find.byIcon(Icons.logout), findsOneWidget);

    // Tap on the "Trang Chủ" tile
    await tester.tap(find.text('Trang Chủ'));
    await tester.pump();
   
    // Verify that the Navigator.pop function is called
    verify(mockNavigatorObserver.didPop( MaterialPageRoute(
                      builder: (context) => HomePage(menuFood: menuFood, menuTabBar: menuTabBar,),
              ), any)).called(1);

    // Tap on the "Cài Đặt" tile
    await tester.tap(find.text('Cài Đặt'));
    await tester.pumpAndSettle();

    // Verify that the Navigator.push function is called with SettingsPage
    verify(mockNavigatorObserver.didPush(MaterialPageRoute(
                builder: (context) => SettingsPage()
              ), any)).called(1);

    // Tap on the "Đăng Xuất" tile
    await tester.tap(find.text('Đăng Xuất'));
    await tester.pump();

    // Verify that the logout function is called
    // You may need to mock AuthService and verify that the signOut function is called
    // In this example, we assume AuthService is mocked and signOut is called
  });
}

