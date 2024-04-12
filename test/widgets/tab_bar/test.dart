import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/components/my_tab_bar.dart'; // Replace with your MyTabBar file path
import 'package:fooddelivtute/models/food.dart';
import 'package:flutter/src/scheduler/ticker.dart';
void main() {
  testWidgets('MyTabBar UI Test', (WidgetTester tester) async {
    // Create a TabController
    final TabController tabController = TabController(length: FoodCategory.values.length, vsync: TesterVsync());

    // Build the MyTabBar widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MyTabBar(
            tabController: tabController,
          ),
        ),
      ),
    );

    // Verify that the TabBar and its tabs are rendered correctly
    expect(find.byType(TabBar), findsOneWidget);
    expect(find.byType(Tab), findsNWidgets(FoodCategory.values.length));

    // Verify that the text of the tabs matches the names of the FoodCategory enum
    for (int i = 0; i < FoodCategory.values.length; i++) {
      final FoodCategory category = FoodCategory.values[i];
      expect(find.text(category.toString().split('.').last), findsOneWidget);
    }
  });
}

// Define a custom Vsync implementation for testing
class TesterVsync extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick, debugLabel: 'created by MyTabBar test');
  }
}
