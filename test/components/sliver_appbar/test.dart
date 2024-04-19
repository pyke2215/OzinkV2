import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/pages/cart_page.dart';
import 'package:fooddelivtute/components/my_sliver_app_bar.dart';
import 'package:mockito/mockito.dart';
import 'package:fooddelivtute/pages/cart_page.dart';
class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('MySliverAppBar renders correctly', (WidgetTester tester) async {
    final MockNavigatorObserver navigatorObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MySliverAppBar(
            child: Container(), // Placeholder child widget
            title: const Text('Test Title'),
          ),
        ),
        navigatorObservers: [navigatorObserver],
      ),
    );

    // Verify that the title is rendered
    expect(find.text('Test Title'), findsOneWidget);

    // Verify that the cart button is rendered
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);

    // Tap on the cart button
    await tester.tap(find.byIcon(Icons.shopping_cart_outlined));
    await tester.pumpAndSettle();

    // Verify that the navigator pushes the CartPage
    verify(navigatorObserver.didPush(MaterialPageRoute(
      builder: (context) => CartPage()), any)).called(1);
    expect(find.byType(CartPage), findsOneWidget);
  });
}
