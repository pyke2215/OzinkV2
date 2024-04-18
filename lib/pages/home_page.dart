import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fooddelivtute/components/my_food_tile.dart';
import 'package:fooddelivtute/components/my_tab_bar.dart';
import 'package:fooddelivtute/services/database/firestore.dart';
import 'package:fooddelivtute/models/food.dart';
import 'package:fooddelivtute/pages/food_page.dart';
import 'package:provider/provider.dart';

import '../components/my_current_location.dart';
import '../components/my_description_box.dart';
import '../components/my_drawer.dart';
import '../components/my_sliver_app_bar.dart';

class HomePage extends StatefulWidget {
  final List<String> menuTabBar;
  final List<Food> menuFood;

  const HomePage({super.key, required this.menuTabBar, required this.menuFood});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Stream để lắng nghe sự thay đổi của dữ liệu từ Firestore và cập nhật menuFood
  StreamSubscription<QuerySnapshot>? _subscription;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: menuTabBar.length, vsync: this);

    // Lắng nghe sự thay đổi của dữ liệu từ Firestore và cập nhật menuFood
    _subscription = FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        menuFood = snapshot.docs.map((doc) {
          final data = doc.data();
          return Food(
            name: data['name'],
            description: data['description'],
            price: data['price'],
            imagePath: data['imagePath'],
            category: data['category'],
          );
        }).toList();
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();

    // Hủy lắng nghe sự thay đổi của dữ liệu từ Firestore
    _subscription?.cancel();

    super.dispose();
  }

  // sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(String category, List<Food> fullMenu) {
    return fullMenu
        .where((food) => food.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  // return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return menuTabBar.map((category) {
      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get individual food
          final food = categoryMenu[index];

          // return food tile
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(
              menuTabBar: menuTabBar,
              tabController: _tabController,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),

                // my current location
                MyCurrentLocation(),

                // description box
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            // children: getFoodInThisCategory(restaurant.menu),
            children: getFoodInThisCategory(menuFood),
          ),
        ),
      ),
    );
  }
}
