import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/home/categories_tab.dart';
import 'package:meals_app/screens/home/favorites_tab.dart';
import 'package:meals_app/utils/favorite_meals_manager.dart';

class Tabs extends StatefulWidget {
  final FavoriteMealsManager favoritesManager;

  const Tabs({super.key, required this.favoritesManager});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget tabContent;
    String title;

    switch (_currentTabIndex) {
      case 0:
        title = 'Categories';
        tabContent = CategoriesTab(
          categories: availableCategories,
          favoritesManager: widget.favoritesManager,
        );
        break;
      default:
        title = 'Favorites';
        tabContent = FavoritesTab(
          favoritesManager: widget.favoritesManager,
        );
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: tabContent,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setCurrentTab,
        currentIndex: _currentTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  void _setCurrentTab(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }
}
