import 'package:flutter_test/flutter_test.dart';
import 'package:fooddelivtute/models/food.dart';
import 'package:fooddelivtute/pages/food_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';
import 'package:fooddelivtute/components/my_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivtute/pages/home_page.dart';
import 'package:fooddelivtute/components/my_sliver_app_bar.dart';
import 'package:fooddelivtute/components/my_drawer.dart';
import 'package:fooddelivtute/components/my_current_location.dart';
import 'package:fooddelivtute/components/my_description_box.dart';
import 'package:fooddelivtute/components/my_food_tile.dart';

class MockNavigatorObserver extends NavigatorObserver {}

class MockQuerySnapshot extends Mock implements QuerySnapshot {}

List<String> menuTabBar = [];
List<Food> menuFood = [];
void main() {

  group("Test foodpage method", (){

    setUp(() async{
      menuTabBar = await fetchMenuTabBar();
      fetchMenuData();
    });
    testWidgets('HomePage widget test', (WidgetTester tester) async {
      final mockNavigatorObserver = MockNavigatorObserver();

      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(
            menuTabBar: menuTabBar,
            menuFood: menuFood,
          ),
          navigatorObservers: [mockNavigatorObserver],
        ),
      );

      // Verify that the TabBarView is rendered
      expect(find.byType(MyTabBar), findsOneWidget);

      // Verify that the TabBarView children are rendered
      expect(find.byType(ListView), findsNWidgets(2));

      // Verify that the MySliverAppBar is rendered
      expect(find.byType(MySliverAppBar), findsOneWidget);

      // Verify that the MyTabBar is rendered
      expect(find.byType(MyTabBar), findsOneWidget);

      // Verify that the MyDrawer is rendered
      expect(find.byType(MyDrawer), findsOneWidget);

      // Verify that the MyCurrentLocation is rendered
      expect(find.byType(MyCurrentLocation), findsOneWidget);

      // Verify that the MyDescriptionBox is rendered
      expect(find.byType(MyDescriptionBox), findsOneWidget);

      // Tap on a FoodTile and navigate to FoodPage
      await tester.tap(find.byType(FoodTile).first);
      await tester.pumpAndSettle();

      // Verify that FoodPage is pushed onto the Navigator
      menuTabBar.map((cateogry) {
        List<Food> drinks = _filterMenuByCategory(cateogry, menuFood);
        for(int i = 0; i < drinks.length; i++){
             verify(mockNavigatorObserver.didPush(
               MaterialPageRoute(
                      builder: (context) => HomePage(menuFood: menuFood, menuTabBar: menuTabBar,),
              ),
              MaterialPageRoute(
                      builder: (context) => FoodPage(food: drinks[i]),
              ))).called(1);         
        }      
      });
      expect(find.byType(FoodPage), findsOneWidget);
    });
  });
}


Future fetchMenuTabBar() async {
  // Phương thức để fetch dữ liệu từ Firestore và cập nhật menuTabBar
  final QuerySnapshot querySnapshotTabBar =
      await FirebaseFirestore.instance.collection('categories').get();
  menuTabBar =
      querySnapshotTabBar.docs.map((doc) => doc['name'] as String).toList();
}

void fetchMenuData() async {
  final QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('products').get();
  menuFood = querySnapshot.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Food(
      name: data['name'],
      description: data['description'],
      price: data['price'],
      imagePath: data['imagePath'],
      category: data['category'],
    );
  }).toList();
}

List<Food> _filterMenuByCategory(String category, List<Food> fullMenu) {
    return fullMenu
        .where((food) => food.category.toLowerCase() == category.toLowerCase())
        .toList();
  }