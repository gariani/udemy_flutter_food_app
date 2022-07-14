import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';
import 'package:meals/components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    Key? key,
    required this.favorites,
  }) : super(key: key);

  final List<Meal> favorites;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens = [];

  _selectItem(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _screens = [
      {'title': 'Lista de Categorias', 'screen': const CategoriesScreen()},
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(
          favoritesMeals: widget.favorites,
        )
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_screens[_selectedScreenIndex]['title'] as String),
        ),
        drawer: const MainDrawer(),
        body: _screens[_selectedScreenIndex]['screen'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedScreenIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          onTap: _selectItem,
          backgroundColor: Theme.of(context).colorScheme.primary,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: 'Categorias',
              icon: Icon(Icons.category),
            ),
            BottomNavigationBarItem(
              label: 'Favorito',
              icon: Icon(Icons.star),
            )
          ],
        ),
      ),
    );
  }
}
