import 'package:flutter/material.dart';
import 'package:meals_app/ui/features/filters/filters_screen.dart';
import 'package:meals_app/ui/features/home/categories/categories_tab.dart';
import 'package:meals_app/ui/features/home/drawer/main_drawer.dart';
import 'package:meals_app/ui/features/home/favorites/favorites_tab.dart';

class TabContent {
  final String title;
  final Widget widget;

  TabContent({required this.title, required this.widget});
}

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    TabContent tabContent = _resolveActiveTabContent();

    return Scaffold(
      appBar: AppBar(
        title: Text(tabContent.title),
      ),
      drawer: MainDrawer(
        onDrawerItemSelected: _onDrawerItemSelected,
      ),
      body: tabContent.widget,
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

  Future<void> _onDrawerItemSelected(String identifier) async {
    switch (identifier) {
      case 'meals':
        {
          _setCurrentTab(0);
          Navigator.of(context).pop();
          break;
        }
      case 'filters':
        {
          Navigator.of(context).pop();
          var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const FiltersScreen();
          }));

          if (result == 'refresh') {
            setState(() {});
          }

          break;
        }
    }
  }

  TabContent _resolveActiveTabContent() {
    switch (_currentTabIndex) {
      case 0:
        return TabContent(
          title: 'Categories',
          widget: const CategoriesTab(),
        );
      default:
        return TabContent(
          title: 'Favorites',
          widget: const FavoritesTab(),
        );
    }
  }

  void _setCurrentTab(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }
}
