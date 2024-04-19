import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final List<String> menuTabBar;

  const MyTabBar({
    super.key,
    required this.tabController,
    required this.menuTabBar,
  });

  List<Tab> _buildCategoryTabs() {
    return menuTabBar.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
