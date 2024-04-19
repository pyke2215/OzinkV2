import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_tab_bar.dart';

void main() {
  testWidgets('MyTabBar builds tabs correctly', (WidgetTester tester) async {
    // Define the menuTabBar list
    final List<String> menuTabBar = ['Tab1', 'Tab2', 'Tab3'];

    // Create a TabController with a length equal to the length of menuTabBar
    final TabController tabController = TabController(
      length: menuTabBar.length,
      vsync: const TestVSync(),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: DefaultTabController(
          length: menuTabBar.length,
          child: Scaffold(
            appBar: AppBar(
              bottom: MyTabBar(
                tabController: tabController,
                menuTabBar: menuTabBar,
              ),
            ),
            body: const SizedBox(), // Placeholder body widget
          ),
        ),
      ),
    );

    // Verify that the correct number of tabs are built
    expect(find.byType(Tab), findsNWidgets(menuTabBar.length));

    // Verify that the text of each tab matches the corresponding category in menuTabBar
    for (int i = 0; i < menuTabBar.length; i++) {
      expect(find.text(menuTabBar[i]), findsOneWidget);
    }
  });
}
