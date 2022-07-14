import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = dummyMeals;
  Settings _settings = Settings();

  final List<Meal> _favorites = [];

  bool _isFavorite(Meal meal) {
    return _favorites.contains(meal);
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favorites.contains(meal)
          ? _favorites.remove(meal)
          : _favorites.add(meal);
    });
  }

  void _filterMeals(Settings settings) {
    setState(() {
      _settings = settings;
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegtarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegtarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 15,
                fontFamily: 'RobotoCondensed',
              ),
              titleMedium: const TextStyle(
                fontSize: 14,
                fontFamily: 'RobotoCondensed',
              ),
              titleSmall: const TextStyle(
                fontSize: 12,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(secondary: Colors.amber),
      ),
      initialRoute: '/',
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(favorites: _favorites),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMaelsScreen(meals: _availableMeals),
        AppRoutes.mealDetails: (ctx) => MealDetailScreen(
              onToggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        AppRoutes.settings: (ctx) => SettingsScreen(
              settings: _settings,
              onSettingsChanged: _filterMeals,
            ),
      },
      onGenerateRoute: (settings) {
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return const CategoriesScreen();
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vamos Cozinhar?'),
        ),
        body: const Center(
          child: CategoriesScreen(),
        ),
      ),
    );
  }
}
